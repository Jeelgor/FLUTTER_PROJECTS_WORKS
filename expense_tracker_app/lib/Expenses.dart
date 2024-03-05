// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expense_list/Expense_list.dart';
import 'package:expense_tracker_app/model/Expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredList = [
    Expense(
        title: 'flutter course',
        amount: 499,
        date: DateTime.now(),
        catagory: Catagory.work),
    Expense(
        title: 'Movie',
        amount: 259,
        date: DateTime.now(),
        catagory: Catagory.fun),
  ];
  void _openAddOverlay() {
    //...
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Text('Model Bottom Sheet'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Expense Tracker_app',
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: _openAddOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Cart..'),
          Expanded(
            child: ExpenseList(
              expenses: _registeredList,
            ),
          ),
        ],
      ),
    );
  }
}
