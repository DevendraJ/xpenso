import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:xpenso/utility/data_store.dart';
import 'package:xpenso/widgets/account_list.dart';
import 'package:xpenso/widgets/app_drawer.dart';
import 'package:xpenso/widgets/category_view.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Xpenso',
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.orange[900],
      ),
      routes: {
        "/home": (_) => MyHomePage(),
        "/accounts": (_) => AccountList(),
        "/categories": (_) => CategoryView(),
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
  var dataMonth;
  var dataMonthText;
  var formatter = DateFormat('yyyy - MMM');

  AppBar getAppBar(context) {
    var appBar = AppBar(
      title: RaisedButton(
        elevation: 5,
        color: Colors.white,
        child: Text(
          dataMonthText,
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        onPressed: () {
          showMonthPicker(
            context: context,
            initialDate: DateTime.now(),
          ).then((selectedMonth) {
            setState(() {
              if (selectedMonth != null) {
                dataMonth = selectedMonth;
                dataMonthText = formatter.format(selectedMonth);
              }
              _loadData();
            });
          });
        },
      ),
    );
    return appBar;
  }

  var _userTransactions;
  var income;
  var expense;
  var balance;

  @override
  void initState() {
    super.initState();
    dataMonth = DateTime.now();
    dataMonthText = formatter.format(dataMonth);
    _loadData();
  }

  void _loadData() {
    setState(() {
      _userTransactions = DataStore.getTransactionsForMonth(dataMonth);
      var txSum = DataStore.getTxSumForMonth(dataMonth);
      income = txSum['income'];
      expense = txSum['expense'];
      balance = txSum['balance'];
    });
  }

  void _removeTransaction(int txId) {
    DataStore.removeTx(txId);
    setState(() {
      _userTransactions = DataStore.getTransactionsForMonth(dataMonth);
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = getAppBar(context);
    var remainingHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(),
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
        onPressed: () async {
          bool needsRefresh = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return NewTransaction();
              },
            ),
          );
          if (needsRefresh != null && needsRefresh) {
            _loadData();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
