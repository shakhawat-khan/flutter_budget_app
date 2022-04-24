import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../helpers/color_helper.dart';
import '../models/category_model.dart';
import '../models/expense_model.dart';
import '../widgets/bar_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(category, double totalAmountSpent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.all(20.0),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 2))]),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              category.name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            Text(
              '${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} /  ${category.maxAmount} ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double maxBarWidth = constraints.maxWidth;
            final double percent =
                (category.maxAmount - totalAmountSpent) / category.maxAmount;
            double barWidth = percent * maxBarWidth;

            if (barWidth < 0) {
              barWidth = 0;
            }

            return Stack(
              children: <Widget>[
                Container(
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                Container(
                    height: 20.0,
                    width: barWidth,
                    decoration: BoxDecoration(
                      color: getColor(context, percent),
                      borderRadius: BorderRadius.circular(15.0),
                    ))
              ],
            );
          },
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            //floating: true,
            pinned: true,
            expandedHeight: 100.0,
            leading: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
              iconSize: 30.0,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Center(child: Text('Simple budget'))),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon((Icons.add)),
              )
            ],
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: BarChart(
                  expenses: weeklySpending,
                ),
              );
            } else {
              final Category category = categories[index - 1];
              double totalAmountSpent = 0;
              category.expenses.forEach((Expense expense) {
                totalAmountSpent += expense.cost;
              });

              return _buildCategory(category, totalAmountSpent);
            }
          }, childCount: 1 + categories.length))
        ],
      ),
    );
  }
}
