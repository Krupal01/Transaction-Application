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

  void _deleteTransaction(String id) {
    setState(() {
      transactionList.removeWhere((element) => element.id == id);
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addNew: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
        actions: [
          IconButton(
              onPressed: () => _showBottomSheet(context),
              icon: const Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          TransactionList(
            transaction: transactionList,
            deleteTransaction: _deleteTransaction,
          )
        ],
      ),
    );
  }
}
