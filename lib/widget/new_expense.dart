import 'package:basic_project/modal/Expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  NewExpense({required this.onAddExpense, super.key});
  void Function(Expense newExpense) onAddExpense;
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

  void submitExpenseData() {
    Navigator.pop(context);
    final enteredAmount = double.tryParse(_amountControll.text);
    final isInvalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty || isInvalidAmount) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Invalid User Input"),
            content: Text("Please Check if title and amount entered correctly"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text("Ok"),
              ),
            ],
          );
        },
      );
      return;
    }
    final newExpense = Expense(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategor,
    );

    // Call the onAddExpense function using the widget property
    widget.onAddExpense(newExpense);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountControll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var buttonSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (bctx, constrains) {
      print("min Width:${constrains.minWidth}");
      print("max Width:${constrains.maxWidth}");
      print("min height:${constrains.minHeight}");
      print("max height:${constrains.maxHeight}");
      final maxWidth = constrains.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 26, 16, buttonSpace + 8),
            child: Column(
              children: [
                //first row - Titele of the Expense...........
                if (maxWidth >= 500)
                  Row(
                    children: [
                      // text field for title
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 60,
                          decoration: const InputDecoration(
                              label: Text("title-expense")),
                        ),
                      ),
                      const SizedBox(width: 24),
                      // text field for amound
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
                    ],
                  )
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 60,
                    decoration:
                        const InputDecoration(label: Text("title-expense")),
                  ),
                // second row- amound + DAte picker+.............
                if (maxWidth >= 500)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            _selectedDate == null
                                ? "Nothing Sleceted..."
                                : formater.format(_selectedDate!),
                          ),
                          IconButton(
                            onPressed: _datePicker,
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ],
                  )
                else
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
                const SizedBox(
                  height: 6,
                ),
                //THirst Row ... -Categroy + Buttoon (Save ) (cancel)......................
                if (maxWidth >= 500)
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: submitExpenseData,
                        child: Text("Save"),
                      ),
                    ],
                  )
                else
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
                        },
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: submitExpenseData,
                        child: Text("Save"),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
