import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/model/transaction_model.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transaction;
  final Function deleteTransaction;

  const TransactionList(
      {Key? key, required this.transaction, required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: transaction.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text("\$ ${transaction[index].amount}")),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transaction[index].dateTime),
                  ),
                  trailing: IconButton(
                      onPressed: () =>
                          {deleteTransaction(transaction[index].id)},
                      icon: const Icon(Icons.delete)),
                ));
          }),
    );
  }
}
