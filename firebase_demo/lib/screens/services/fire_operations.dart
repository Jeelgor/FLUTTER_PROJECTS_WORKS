import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

class FireOperation {
  final employee = <String, dynamic>{
    "emp_name": "Ada",
    "contact_info": 23455,
    "position": "CTO",
    "hobby": "play games",
  };
}
