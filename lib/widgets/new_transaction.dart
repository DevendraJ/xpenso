import 'package:flutter/material.dart';
import 'package:xpenso/widgets/expense_income_form.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  @override
  Widget build(BuildContext context) {
    final tabNames = ['Expense', 'Income', 'Transfer'];

    var transferForm = Form(
      key: GlobalKey<FormState>(),
      child: Column(),
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add New Transaction'),
          bottom: TabBar(
            indicatorColor: Colors.grey,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              ...tabNames.map((name) {
                return Text(
                  name,
                  style: TextStyle(),
                );
              })
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ExpenseAndIncomeForm(isExpense: true),
            ExpenseAndIncomeForm(isExpense: false),
            transferForm
          ],
        ),
      ),
    );
  }
}
