import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final formater = DateFormat.yMd();

enum Category { food, travel, work, tafrih }

final categroryIcons = {
  Category.food: Icons.food_bank,
  Category.tafrih: Icons.movie,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.work: Icons.work_history,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String title;
  final String id;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return formater.format(date);
  }
}
