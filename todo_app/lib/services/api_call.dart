import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/models/todo.dart';

class APICALL {
  static addTask(int id, String task) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));
    request.body = json.encode({"id": id, "Task": task});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static fetchTask() async {
    List<Todo> todos = [];
    http.Response response = await http.get(
      Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'),
    );

    if (response.statusCode == 200) {
      print(await response.body.toString());
      todos = todoFromJson(response.body);
      print('total todos ${todos.length}');
    } else {
      print(response.reasonPhrase);
    }
    return todos;
  }

  static updateTask(int id, bool completed) async {
    var headers = {'Content-Type': 'application.json'};
    var body = json.encode({"completed": completed});
    http.Response response = await http.put(
      Uri.parse(
        ('https://node-todo-api-yjo3.onrender.com/todos/$id'),
      ),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(await response.body.toString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static DeleteTask(int id) async {
    var headers = {'Content-Type': 'application.json'};

    http.Response response = await http.delete(
      Uri.parse(
        ('https://node-todo-api-yjo3.onrender.com/todos/$id'),
      ),
    );
    if (response.statusCode == 200) {

      
      print(await response.body.toString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
