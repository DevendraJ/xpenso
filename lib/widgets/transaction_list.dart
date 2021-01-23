import 'package:flutter/material.dart';
import 'package:xpenso/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> txList;

  final Function onPressed;

  TransactionList({this.txList, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ...txList.map((tx) {
            return Card(
              child: ListTile(
                title: Text(tx.description),
                subtitle: Text(tx.amount.toStringAsFixed(2)),
                leading: FlutterLogo(),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    onPressed(tx.id);
                  },
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
