// attendance_taking_screen.dart

import 'package:attendance_system/excle.dart';
import 'package:flutter/material.dart';
import 'studentlist.dart'; // Import the student list fetcher
// Import necessary packages
import 'package:cloud_firestore/cloud_firestore.dart';

// In attendance_taking_screen.dart

class AttendanceTakingScreen extends StatefulWidget {
  final String className;

  AttendanceTakingScreen({required this.className});

  @override
  _AttendanceTakingScreenState createState() => _AttendanceTakingScreenState();
}

class _AttendanceTakingScreenState extends State<AttendanceTakingScreen> {
  List<StudentModel> studentList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the list of students for the selected class (Class A or B)
    studentList =
        generateStudentList(); // Use the function from studentlist.dart
  }

  void saveAttendance() async {
    // Navigate to the attendance summary page and pass the attendance data
    print('Saving attendance...');
    await ExcelExporter.exportToExcel(studentList);
    print('Attendance saved to Excel.');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AttendanceSummaryPage(
          className: widget.className,
          students: studentList,
        ),
      ),
    );
  }

  void showAttendanceData() async {
    // Navigate to the attendance data page and pass the attendance data
    await ExcelExporter.exportToExcel(studentList);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AttendanceDataPage(
          className: widget.className,
          students: studentList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance - ${widget.className}'),
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(studentList[index].name),
            trailing: Checkbox(
              value: studentList[index].isPresent,
              onChanged: (value) {
                setState(() {
                  studentList[index].isPresent = value ?? false;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'saveAttendanceHero',
            onPressed: saveAttendance,
            child: Icon(Icons.save),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'showAttendanceDataHero',
            onPressed: showAttendanceData,
            child: Icon(Icons.bar_chart),
          ),
        ],
      ),
    );
  }
}

// ... (rest of your code remains unchanged)

class StudentModel {
  final String id;
  final String name;
  bool isPresent;

  StudentModel({required this.id, required this.name, required this.isPresent});
}

class AttendanceSummaryPage extends StatelessWidget {
  final String className;
  final List<StudentModel> students;

  AttendanceSummaryPage({required this.className, required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Summary - $className'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            subtitle: Text(students[index].isPresent ? 'Present' : 'Absent'),
          );
        },
      ),
    );
  }
}

class AttendanceDataPage extends StatelessWidget {
  final String className;
  final List<StudentModel> students;

  AttendanceDataPage({required this.className, required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Data - $className'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Attendance Data for $className:'),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: students.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(students[index].name),
                subtitle:
                    Text(students[index].isPresent ? 'Present' : 'Absent'),
              );
            },
          ),
        ],
      ),
    );
  }
}
