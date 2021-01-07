import 'dart:ffi';

import 'package:flutter/material.dart';

class MonthOverview extends StatelessWidget {
  final double income;
  final double expense;
  final double balance;

  MonthOverview(this.income, this.expense, this.balance);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        shadowColor: Colors.yellowAccent.shade700,
        elevation: 5,
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Income',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(income.toStringAsFixed(2)),
              ],
            ),
            Text(
              '|',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Expense',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(expense.toStringAsFixed(2)),
              ],
            ),
            Text(
              '|',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Balance',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(balance.toStringAsFixed(2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
