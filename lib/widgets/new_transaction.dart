import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNew;

  const NewTransaction({Key? key, required this.addNew}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  DateTime? _selectedDate;

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitTransaction() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0 ||
        _selectedDate == null) {
      return;
    }

    widget.addNew(
      titleController.text,
      double.parse(amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
                hintText: 'Title',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: amountController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                  hintText: 'Amount'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(_selectedDate == null
                    ? "No Date Choosen!"
                    : "Picked Date : ${DateFormat.yMd().format(_selectedDate!)}"),
                TextButton(
                    onPressed: _selectDate,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ))
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(5.0),
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _submitTransaction,
                child: const Text("Save Data"),
              ))
        ],
      ),
    );
  }
}
