import 'package:flutter/material.dart';
import 'package:transaction_app/model/transaction_model.dart';
import 'package:transaction_app/widgets/new_transaction.dart';
import 'package:transaction_app/widgets/transasction_list.dart';
import 'package:transaction_app/widgets/week_chart.dart';

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

  void _addNewTransaction(String inTitle, double inAmount, DateTime date) {
    setState(() {
      transactionList.add(
          TransactionModel(inTitle, date, inAmount, DateTime.now().toString()));
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

  List<TransactionModel> get _recentTransaction {
    return transactionList.where((element) {
      return element.dateTime
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
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
          WeekChart(recentTransactions: _recentTransaction),
          TransactionList(
            transaction: transactionList,
            deleteTransaction: _deleteTransaction,
          )
        ],
      ),
    );
  }
}
