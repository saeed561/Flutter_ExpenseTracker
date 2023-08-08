import 'package:basic_project/modal/Expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';

class NewExpense extends StatefulWidget {
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountControll = TextEditingController();
  Category _selectedCategor = Category.food;
  DateTime? _selectedDate;
  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 2,
      now.month,
      now.day,
    );
    final datePicked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = datePicked;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountControll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 60,
            decoration: const InputDecoration(label: Text("title-expense")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountControll,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text("\$"),
                    label: Text(" amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? "Nothing Sleceted..."
                        : formater.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _datePicker,
                    icon: Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategor,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategor = value;
                    });
                    ;
                  }),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountControll.text);
                  },
                  child: Text("Save"))
            ],
          ),
        ],
      ),
    );
  }
}
