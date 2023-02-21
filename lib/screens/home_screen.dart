import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
            height: 100,
            color: Colors.red,
          );
        }, childCount: 10))
      ]),
    );
  }
}
