import 'package:flutter/material.dart';
import 'package:transaction_app/model/transaction_model.dart';
import 'package:transaction_app/widgets/new_transaction.dart';
import 'package:transaction_app/widgets/transasction_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final transactionList = [
    TransactionModel("title", DateTime(2012, 2, 5, 2, 30), 20.52,
        DateTime(2012, 2, 5, 2, 30).toString()),
    TransactionModel("title", DateTime(2012, 2, 5, 2, 30), 20.52,
        DateTime(2012, 2, 5, 2, 30).toString()),
  ];

  void _addNewTransaction(String inTitle, double inAmount) {
    setState(() {
      transactionList.add(TransactionModel(
          inTitle, DateTime.now(), inAmount, DateTime.now().toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          addNew: _addNewTransaction,
        ),
        TransactionList(transaction: transactionList)
      ],
    );
  }
}
