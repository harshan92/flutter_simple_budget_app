import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_budget_app/data/data.dart';

import '../widgets/bar_charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        }, childCount: 1))
      ]),
    );
  }
}
