import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

const uuid = Uuid();

enum Catagory { food, travel, work, fun }

const catagoryIcons = {
  Catagory.food: Icons.lunch_dining,
  Catagory.travel: Icons.flight_takeoff,
  Catagory.work: Icons.work,
  Catagory.fun: Icons.movie,
};

class Expense {
  Expense(
      {required this.amount,
      required this.date,
      required this.title,
      required this.catagory})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final catagory;

  String get foratetedDate {
    return formater.format(date);
  }
}
