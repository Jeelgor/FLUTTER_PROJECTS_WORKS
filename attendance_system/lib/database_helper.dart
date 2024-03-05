import 'package:attendance_system/attendance_takingScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  final CollectionReference studentsCollection =
      FirebaseFirestore.instance.collection('students');

  Future<void> updateStudent(StudentModel student) async {
    await studentsCollection.doc(student.id).set(student.toString());
  }

  Future<List<StudentModel>> getStudents() async {
    QuerySnapshot querySnapshot = await studentsCollection.get();
    return querySnapshot.docs.map((doc) {
      return StudentModel(
        id: doc.id,
        name: doc['name'] as String,
        isPresent: doc['isPresent'] as bool,
      );
    }).toList();
  }
}
