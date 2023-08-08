import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category { food, travel, work, tafrih }

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
}
