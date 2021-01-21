import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:xpenso/constants/category_type.dart';
import 'package:xpenso/utility/data_store.dart';
import 'package:xpenso/widgets/list_view_text_item.dart';

import 'grid_view_item.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var currentSelected = CategoryType.expense;

  int _selectedFromAccount = -1;
  int _selectedToAccount = -1;
  int _selectedExpenseCategory = -1;
  int _selectedIncomeCategory = -1;

  void _resetSelectedItems() {
    _selectedFromAccount = -1;
    _selectedToAccount = -1;
    _selectedExpenseCategory = -1;
    _selectedIncomeCategory = -1;
  }

  var accounts = DataStore.getAccounts;
  var expenseCategories = DataStore.getCategories;
  var incomeCategories = DataStore.getCategories;
  var txDate = DateTime.now();

  var _formKey = GlobalKey<FormState>();
  var amountController;
  var dateController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: '0');
    dateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var dropDown = DropdownButtonHideUnderline(
      child: DropdownButton(
          value: currentSelected,
          items: [
            DropdownMenuItem(
                child: Text('Expense'), value: CategoryType.expense),
            DropdownMenuItem(child: Text('Income'), value: CategoryType.income),
            DropdownMenuItem(
                child: Text('Transfer'), value: CategoryType.transfer)
          ],
          onChanged: (currentSelectedItem) {
            setState(() {
              currentSelected = currentSelectedItem;
              _resetSelectedItems();
            });
          }),
    );

    return Scaffold(
      appBar: AppBar(
        title: dropDown,
      ),
      body: Form(
        key: _formKey,
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
                          textAlign: TextAlign.center,
                          controller: amountController,
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
              if (currentSelected != CategoryType.transfer)
                Text(
                  'Select Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              if (currentSelected != CategoryType.transfer)
                Container(
                  height: 250,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    childAspectRatio: 3 / 2,
                    crossAxisCount: 2,
                    children: [
                      ...(currentSelected == CategoryType.expense)
                          ? (expenseCategories.map((category) {
                              return GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      _selectedExpenseCategory = category.id;
                                    },
                                  );
                                },
                                child: GridViewItem(
                                    category,
                                    category.id == _selectedExpenseCategory,
                                    Colors.indigo[300]),
                              );
                            }))
                          : (incomeCategories.map((category) {
                              return GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      _selectedIncomeCategory = category.id;
                                    },
                                  );
                                },
                                child: GridViewItem(
                                    category,
                                    category.id == _selectedIncomeCategory,
                                    Colors.indigo[300]),
                              );
                            }))
                    ],
                  ),
                ),
              if (currentSelected != CategoryType.transfer)
                SizedBox(height: 10),
              Text(
                (currentSelected != CategoryType.transfer)
                    ? 'Select Account'
                    : 'Select From Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...accounts.map((account) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedFromAccount = account.id;
                          });
                        },
                        child: ListViewTextItem(
                          account.title,
                          _selectedFromAccount == account.id,
                          Colors.indigo[300],
                        ),
                      );
                    })
                  ],
                ),
              ),
              SizedBox(height: 10),
              if (currentSelected == CategoryType.transfer)
                Text(
                  'Select To Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              SizedBox(height: 10),
              if (currentSelected == CategoryType.transfer)
                Container(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...accounts.map((account) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedToAccount = account.id;
                            });
                          },
                          child: ListViewTextItem(
                            account.title,
                            (_selectedToAccount == account.id),
                            Colors.indigo[300],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              SizedBox(height: 10),
              DateTimePicker(
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
                decoration: InputDecoration(
                  labelText: 'Transaction Date',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                controller: dateController,
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(
                      Icons.message,
                    )),
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
                    color: Colors.grey[300],
                    minWidth: MediaQuery.of(context).size.width / 2,
                  ),
                  FlatButton(
                    height: 60,
                    onPressed: () {},
                    child: Text('Save'),
                    color: Colors.indigo[300],
                    minWidth: MediaQuery.of(context).size.width / 2,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
