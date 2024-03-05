import 'package:attendance_system/attendance_takingScreen.dart';
import 'package:flutter/material.dart';

class Attendance_Screen extends StatelessWidget {
  const Attendance_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Class'),
      ),
      body: ListView(
        children: [
          _buildClassTile(context, 'Class A'),
          _buildClassTile(context, 'Class B'),
          // Add more classes as needed
        ],
      ),
    );
  }

  Widget _buildClassTile(BuildContext context, String className) {
    return ListTile(
      title: Text(className),
      onTap: () {
        // Navigate to the attendance screen for the selected class
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AttendanceTakingScreen(className: className),
          ),
        );
      },
    );
  }
}
