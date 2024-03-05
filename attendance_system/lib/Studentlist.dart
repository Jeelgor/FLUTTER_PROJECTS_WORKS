// student_list.dart

import 'package:attendance_system/attendance_takingScreen.dart';
// studentlist.dart

// class StudentModel {
//   final String id;
//   final String name;
//   bool isPresent;

//   StudentModel({
//     required this.id,
//     required this.name,
//     required this.isPresent,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'isPresent': isPresent,
//     };
//   }
// }

List<StudentModel> generateStudentList() {
  return [
    StudentModel(id: '1', name: 'Jeel', isPresent: false),
    StudentModel(id: '2', name: 'Raj', isPresent: false),
    StudentModel(id: '3', name: 'Mitesh', isPresent: false),
    StudentModel(id: '4', name: 'Yash', isPresent: false),
    StudentModel(id: '5', name: 'Aditya', isPresent: false),
    StudentModel(id: '6', name: 'Vipul', isPresent: false),
    StudentModel(id: '7', name: 'Jay', isPresent: false),
    StudentModel(id: '8', name: 'Harsh', isPresent: false),
    StudentModel(id: '9', name: 'Ankul', isPresent: false),
    StudentModel(id: '10', name: 'Ram', isPresent: false),
  ];
}
