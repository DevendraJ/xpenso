import 'package:flutter/material.dart';
import 'package:xpenso/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> txList;

  TransactionList({this.txList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      color: Colors.green,
      child: Column(
        children: [
          ...txList.map((tx) {
            return Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    height: 70,
                    child: Text(
                      '₹',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(tx.title),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      tx.amount.toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
