import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/api_call.dart';

class TODO_APP extends StatefulWidget {
  const TODO_APP({super.key});

  @override
  State<TODO_APP> createState() => _TODO_APPState();
}

class _TODO_APPState extends State<TODO_APP> {
  // make controller for show tassk
  TextEditingController _taskController = TextEditingController();

  // make a list
  late List<Todo> todos;
  @override
  void initState() {
    todos = [];
    fetchAllTask();
    super.initState();
  }

  fetchAllTask() async {
    todos = await APICALL.fetchTask();

    // var ret = await APICALL.fetchTask();
    // todos.addAll(ret);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('totoal todos ${todos.length}'),
      ),
    );
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Column(
        children: [
          //add todos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      labelText: 'Enter Task',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    // add task in list
                    if (_taskController.text.isNotEmpty) {
                      // todos.add(Todo(DateTime.now().millisecondsSinceEpoch,
                      // _taskController.text, false));
                      await APICALL.addTask(
                          DateTime.now().millisecondsSinceEpoch,
                          _taskController.text);
                      _taskController.clear();
                      fetchAllTask();
                      setState(() {});
                    }
                  },
                  icon: Icon(Icons.done),
                ),
              ],
            ),
          ),
          //display todos
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                fetchAllTask();
              },
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  value: todos[index].completed,
                  onChanged: (v) async {
                    await APICALL.updateTask(todos[index].id!, v!);
                    fetchAllTask();
                    // to update task status(completed)
                    todos[index].completed = v!;
                    setState(() {});
                  },
                  title: Text(
                    todos[index].task ?? "",
                    style: todos[index].completed
                        ? TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough)
                        : TextStyle(color: Colors.blue),
                  ),
                  secondary: IconButton(
                    onPressed: () async {
                      // todos.removeAt(index);
                      await APICALL.DeleteTask(todos[index].id!);
                      fetchAllTask();
                      setState(() {});
                    },
                    icon: Icon(Icons.delete),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
