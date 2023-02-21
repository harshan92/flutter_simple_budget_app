import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_budget_app/data/data.dart';
import 'package:simple_budget_app/models/category_model.dart';
import 'package:simple_budget_app/models/expense_model.dart';

import '../widgets/bar_charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(category, totalAmountSpent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)
          ]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category.name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            Text(
              '\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} / \$${category.maxAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          forceElevated: true,
          floating: true,
          pinned: true,
          expandedHeight: 100.0,
          leading: IconButton(
            icon: Icon(Icons.settings),
            iconSize: 30.0,
            onPressed: () {},
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Simple Budget"),
            centerTitle: true,
          ),
          actions: [
            IconButton(onPressed: () {}, iconSize: 30.0, icon: Icon(Icons.add))
          ],
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: BarChart(weeklySpending),
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
      ]),
    );
  }
}
