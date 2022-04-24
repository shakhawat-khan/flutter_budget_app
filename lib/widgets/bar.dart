import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150;

  Bar(
      {required this.label,
      required this.amountSpent,
      required this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;

    return Column(
      children: <Widget>[
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
