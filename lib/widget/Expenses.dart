import 'package:basic_project/widget/New_Expense.dart';
import 'package:basic_project/widget/expenses_list/expenses_list.dart';
import 'package:basic_project/modal/Expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("my expense tracker"), actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon: const Icon(Icons.add_circle_outline_rounded),
        ),
      ]),
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
