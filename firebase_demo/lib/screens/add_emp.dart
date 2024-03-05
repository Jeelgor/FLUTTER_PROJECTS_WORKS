import 'package:firebase_demo/screens/services/fire_operations.dart';
import 'package:flutter/material.dart';

class AddEmp extends StatefulWidget {
  const AddEmp({super.key});

  @override
  State<AddEmp> createState() => _AddEmpState();
}

class _AddEmpState extends State<AddEmp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text('Emplyoee Name:'),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Emplyoee ContactNo::'),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Emplyoee Position:'),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Emplyoee Hobby:'),
            ),
          ),
          ElevatedButton(
            onPressed: () async{
              await FireOperation.addEmployee();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
