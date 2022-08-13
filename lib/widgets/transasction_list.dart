import 'dart:math';
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
      padding: const EdgeInsets.all(5),
      child: ListView( 
        children : transaction
        .map((tx) => TransactionItem(
                key: ValueKey(tx.id),
                transaction: tx,
                deleteTransaction: deleteTransaction)
        ).toList()
      ),
    );
  }
}

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final TransactionModel transaction;
  final Function deleteTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;
  @override
  void initState() {
    const bgColors = [Colors.red, Colors.yellow, Colors.blue, Colors.grey];
    _bgColor = bgColors[Random().nextInt(4)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(child: Text("\$ ${widget.transaction.amount}")),
            ),
          ),
          title: Text(
            widget.transaction.title,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(widget.transaction.dateTime),
          ),
          trailing: IconButton(
              onPressed: () =>
                  {widget.deleteTransaction(widget.transaction.id)},
              icon: const Icon(Icons.delete)),
        ));
  }
}
