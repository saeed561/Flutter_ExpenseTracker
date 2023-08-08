import 'package:basic_project/modal/Expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text("\$ ${expense.amount.toStringAsFixed(2)}"),
                Spacer(),
                Row(
                  children: [
                    Icon(categroryIcons[expense.category]),
                    //Icon(Icons.flight_takeoff_outlined),
                    Text(
                      formater.format(expense.date),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
