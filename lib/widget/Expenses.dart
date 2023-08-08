import 'package:basic_project/widget/expenses_list/expenses_list.dart';
import 'package:basic_project/modal/Expense.dart';
import 'package:flutter/material.dart';
class Expenses extends StatelessWidget {
  Expenses({super.key});
  final List<Expense> _myExpenses = [
    Expense(
        title: "Kebab",
        amount: 260.8,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Flutter",
        amount: 15260.8,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Esfahan",
        amount: 220.8,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "Cinema",
        amount: 80.8,
        date: DateTime.now(),
        category: Category.tafrih),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ExpensesList(expenses: _myExpenses),
          ),
        ],
      ),
    );
  }
}
