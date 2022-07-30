import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNew;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  NewTransaction({Key? key, required this.addNew}) : super(key: key);

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
              padding: const EdgeInsets.all(5.0),
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  addNew(titleController.text,
                      double.parse(amountController.text));
                },
                child: const Text("Save Data"),
              ))
        ],
      ),
    );
  }
}
