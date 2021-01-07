import 'package:flutter/material.dart';
import 'package:xpenso/model/transaction.dart';
import 'package:xpenso/utility/data_store.dart';
import 'package:xpenso/widgets/month_overview.dart';
import 'package:xpenso/widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpenso',
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.yellowAccent.shade700,
        accentColor: Colors.orange[900],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _userTransactions = DataStore.txList;
  var income = DataStore.txSum['income'];
  var expense = DataStore.txSum['expense'];
  var balance = DataStore.txSum['balance'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xpenso'),
      ),
      body: Column(
        children: [
          MonthOverview(income, expense, balance),
          TransactionList(
            txList: _userTransactions,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
