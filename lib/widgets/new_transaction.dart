import 'package:flutter/material.dart';
import 'package:xpenso/widgets/expense_income_form.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var currentSelected = 1;
  @override
  Widget build(BuildContext context) {
    var dropDown = DropdownButtonHideUnderline(
      child: DropdownButton(
          value: currentSelected,
          items: [
            DropdownMenuItem(child: Text('Expense'), value: 1),
            DropdownMenuItem(child: Text('Income'), value: 2),
            DropdownMenuItem(child: Text('Transfer'), value: 3)
          ],
          onChanged: (currentSelectedItem) {
            setState(() {
              currentSelected = currentSelectedItem;
            });
          }),
    );

    var transferForm = Form(
      key: GlobalKey<FormState>(),
      child: Column(),
    );
    return Scaffold(
      appBar: AppBar(
        title: dropDown,
      ),
      body: (currentSelected == 1)
          ? ExpenseAndIncomeForm(isExpense: true)
          : (currentSelected == 2)
              ? ExpenseAndIncomeForm(isExpense: false)
              : transferForm,
    );
  }
}
