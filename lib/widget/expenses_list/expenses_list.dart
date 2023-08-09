import 'package:basic_project/modal/Expense.dart';
import 'package:basic_project/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {required this.expenses, required this.removeExpense, super.key});
  final List<Expense> expenses;
  void Function(Expense expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            color: Theme.of(context).colorScheme.error,
            child: Text(".<.<.<.<.<")),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
