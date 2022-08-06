import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amountPerDay;
  final double percentageOfTotalAmount;

  const ChartBar(
      {Key? key,
      required this.day,
      required this.amountPerDay,
      required this.percentageOfTotalAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text('\$${amountPerDay.toStringAsFixed(0)}'),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                  decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              )),
              FractionallySizedBox(
                heightFactor: percentageOfTotalAmount,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(day)
      ],
    );
  }
}
