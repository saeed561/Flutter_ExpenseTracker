import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';

class NewExpense extends StatefulWidget {
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  var _enteredTitle = '';
  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
            maxLength: 60,
            decoration: const InputDecoration(label: Text("title-expense")),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_enteredTitle);
                  },
                  child: Text("Save"))
            ],
          ),
        ],
      ),
    );
  }
}
