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
  @override
  void dispose() {
    _titleController.dispose();
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
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                  },
                  child: Text("Save"))
            ],
          ),
        ],
      ),
    );
  }
}
