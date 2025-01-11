import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = 'ToDo App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ToDoPage(title: title),
    );
  }
}

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key, required this.title});
  final String title;

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final List<String> _todoList = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    setState(() {
      _todoList.add(_controller.text);
    });
    _controller.clear();
  }

  void _removeTodo(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _controller,
              )),
              ElevatedButton(
                onPressed: _addTodo,
                child: Text('addTodo'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(_todoList[index]),
                    trailing: ElevatedButton(
                      onPressed: () => {_removeTodo(index)},
                      child: Text('removeTodo'),
                    ),
                  ));
                }),
          )
        ]));
  }
}
