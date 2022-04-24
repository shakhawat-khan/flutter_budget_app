import 'package:flutter/material.dart';

import 'bar.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  BarChart({required this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;

    for (var price in expenses) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }

    return Column(
      children: <Widget>[
        Text(
          'Weekly Spending',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
              iconSize: 30.0,
            ),
            Text(
              'Nov 10 2019 - Nov 16 2019',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {},
              iconSize: 30.0,
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bar(
                label: 'su',
                amountSpent: expenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'San',
                amountSpent: expenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mon',
                amountSpent: expenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tue',
                amountSpent: expenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Wed',
                amountSpent: expenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Thu',
                amountSpent: expenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fri',
                amountSpent: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
