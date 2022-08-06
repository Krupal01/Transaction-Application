import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/model/transaction_model.dart';
import 'package:transaction_app/widgets/chart_bar.dart';

class WeekChart extends StatelessWidget {
  final List<TransactionModel> recentTransactions;
  const WeekChart({Key? key, required this.recentTransactions})
      : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalExpensesPerDay = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateTime.day == weekDay.day &&
            recentTransactions[i].dateTime.month == weekDay.month &&
            recentTransactions[i].dateTime.year == weekDay.year) {
          totalExpensesPerDay += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalExpensesPerDay,
      };
    }).reversed.toList();
  }

  double get totalWeekExpenses {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                day: e['day'].toString(),
                amountPerDay: e['amount'] as double,
                percentageOfTotalAmount: totalWeekExpenses == 0.0
                    ? 0.0
                    : (e['amount'] as double) / totalWeekExpenses,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
