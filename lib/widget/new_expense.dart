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
          TextField(
            controller: _amountControll,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefix: Text("\$"),
              label: Text(" amount"),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Cancel"),
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
