import 'package:basic_project/widget/New_Expense.dart';
import 'package:basic_project/widget/chart/chart.dart';
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
  void _updateExpenseList(Expense newExpense) {
    setState(() {
      _myExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final _indexOfDeleterExpense = _myExpenses.indexOf(expense);
    setState(() {
      _myExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Deleted Expense Successfly!"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
            label: "Noo!,Get Back to your place in the list",
            onPressed: () {
              setState(() {
                _myExpenses.insert(_indexOfDeleterExpense, expense);
              });
            }),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _updateExpenseList),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    print(screenwidth);
    Widget screenContent = const Center(
      child: Text("No Expense exists create and Expense by adding one"),
    );
    if (_myExpenses.isNotEmpty) {
      screenContent =
          ExpensesList(expenses: _myExpenses, removeExpense: _removeExpense);
    }
    return Scaffold(
        appBar: AppBar(title: const Text("my expense tracker"), actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add_circle_outline_rounded),
          ),
        ]),
        body: screenwidth < 500
            ? Column(
                children: [
                  Chart(expenses: _myExpenses),
                  Expanded(
                    child: screenContent,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(expenses: _myExpenses),
                  ),
                  Expanded(
                    child: screenContent,
                  ),
                ],
              ));
  }
}
