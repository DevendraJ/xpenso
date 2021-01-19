import 'package:flutter/material.dart';
import 'package:xpenso/utility/data_store.dart';
import 'package:xpenso/widgets/month_overview.dart';
import 'package:xpenso/widgets/new_transaction.dart';
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
        primaryColor: Colors.white,
        accentColor: Colors.orange[900],
      ),
      routes: {
        "/home": (_) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var appBar = AppBar(
    title: Text('Xpenso'),
  );

  var _userTransactions = DataStore.txList;
  var income = DataStore.txSum['income'];
  var expense = DataStore.txSum['expense'];
  var balance = DataStore.txSum['balance'];

  void _removeTransaction(int txId) {
    DataStore.removeTx(txId);
    setState(() {
      _userTransactions = DataStore.txList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var remainingHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            child: MonthOverview(income, expense, balance),
            height: remainingHeight * 0.18,
          ),
          Container(
            child: TransactionList(
              txList: _userTransactions,
              onPressed: _removeTransaction,
            ),
            height: remainingHeight * 0.8,
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return NewTransaction();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
