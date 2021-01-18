import 'package:flutter/material.dart';
import 'package:xpenso/utility/data_store.dart';

import 'grid_view_item.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var currentSelected = 1;

  var accounts = DataStore.getCategories
      .map((account) => GridViewItem(account, false, null));

  var expenseCategories = DataStore.getCategories
      .map((category) => GridViewItem(category, false, null));

  var incomeCategories = DataStore.getCategories
      .map((category) => GridViewItem(category, false, null));

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

    Form getExpenseIncomeForm({bool isExpense}) {
      return Form(
        key: GlobalKey<FormState>(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 80,
                width: MediaQuery.of(context).size.width - 30,
                child: Card(
                  elevation: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'INR',
                        style: TextStyle(
                          fontSize: 30,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Select ${isExpense ? 'Expense' : 'Income'} Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              Container(
                height: 250,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 3 / 2,
                  crossAxisCount: 2,
                  children: [
                    ...(isExpense ? expenseCategories : incomeCategories)
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Select Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [...accounts],
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    height: 60,
                    child: Text('Cancel'),
                    color: Colors.grey[400],
                    minWidth: MediaQuery.of(context).size.width / 2,
                  ),
                  FlatButton(
                    height: 60,
                    onPressed: () {},
                    child: Text('Save'),
                    color: Colors.yellowAccent.shade700,
                    minWidth: MediaQuery.of(context).size.width / 2,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: dropDown,
      ),
      body: (currentSelected == 1)
          ? getExpenseIncomeForm(isExpense: true)
          : (currentSelected == 2)
              ? getExpenseIncomeForm(isExpense: false)
              : transferForm,
    );
  }
}
