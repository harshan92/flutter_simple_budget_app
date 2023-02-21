import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  const BarChart(this.expenses);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;

    expenses.forEach(
      (double price) {
        if (price > mostExpensive) {
          mostExpensive = price;
        }
      },
    );
    return Column(
      children: [
        Text(
          "Weekly Spending",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
            ),
            Text(
              "Nov 10, 2023 - Nov 16, 2023",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward),
              iconSize: 30,
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Bar(
              label: "Su",
              mostExpensive: mostExpensive,
              amountSpent: expenses[0],
            ),
            Bar(
              label: "Mo",
              mostExpensive: mostExpensive,
              amountSpent: expenses[1],
            ),
            Bar(
              label: "Tu",
              mostExpensive: mostExpensive,
              amountSpent: expenses[2],
            ),
            Bar(
              label: "We",
              mostExpensive: mostExpensive,
              amountSpent: expenses[3],
            ),
            Bar(
              label: "Th",
              mostExpensive: mostExpensive,
              amountSpent: expenses[4],
            ),
            Bar(
              label: "Fr",
              mostExpensive: mostExpensive,
              amountSpent: expenses[5],
            ),
            Bar(
              label: "Sa",
              mostExpensive: mostExpensive,
              amountSpent: expenses[6],
            )
          ],
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxBarHeight = 150.0;

  const Bar(
      {super.key,
      required this.label,
      required this.amountSpent,
      required this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          "\$${amountSpent.toStringAsFixed(2)}",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
