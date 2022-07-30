import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/model/transaction_model.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transaction;

  const TransactionList({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction
          .map((e) => Card(
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "\$ ${e.amount}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 1.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                            Text(
                              DateFormat.yMMMd().format(e.dateTime),
                              style: const TextStyle(
                                color: Color.fromARGB(221, 50, 50, 50),
                                fontWeight: FontWeight.normal,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
