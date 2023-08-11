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
        title: "Pasta",
        amount: 260.8,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Flutter",
        amount: 1526.8,
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
        category: Category.hobby),
    Expense(
      title: 'Groceries',
      amount: 50.25,
      date: DateTime(2023, 8, 1),
      category: Category.food,
    ),
    Expense(
      title: 'Movie Tickets',
      amount: 20.0,
      date: DateTime(2023, 8, 5),
      category: Category.hobby,
    ),
    Expense(
      title: 'Gasoline',
      amount: 35.75,
      date: DateTime(2023, 8, 10),
      category: Category.travel,
    ),
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
            label: ",Undo?",
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
      useSafeArea: true,
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
