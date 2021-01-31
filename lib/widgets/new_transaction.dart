import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:xpenso/constants/category_type.dart';
import 'package:xpenso/utility/data_store.dart';
import 'package:xpenso/utility/user_input_exception.dart';
import 'package:xpenso/widgets/list_view_text_item.dart';

import 'grid_view_item.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var _selectedCategoryType = CategoryType.expense;

  int _selectedFromAccount = -1;
  int _selectedToAccount = -1;
  int _selectedExpenseCategory = -1;
  int _selectedIncomeCategory = -1;

  void _resetSelectedItems() {
    setState(() {
      _selectedFromAccount = -1;
      _selectedToAccount = -1;
      _selectedExpenseCategory = -1;
      _selectedIncomeCategory = -1;
    });
  }

  var _txDate = DateTime.now();

  var _formKey = GlobalKey<FormState>();
  TextEditingController amountController;
  TextEditingController descController;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: '0');
    descController = TextEditingController();
  }

  void saveTransaction() {
    var amount = amountController.text;
    if (amount == null) {
      throw UserInputException('Amount is not entered!');
    }

    if (_txDate == null) {
      throw UserInputException('Date is not selected!');
    }

    if (_selectedCategoryType == CategoryType.expense) {
      if (_selectedExpenseCategory == -1) {
        throw UserInputException('Expense Category is not selected!');
      }

      if (_selectedFromAccount == -1) {
        throw UserInputException('Account is not seleted!');
      }

      DataStore.addTx(Transaction(
        description: descController.text,
        amount: double.parse(amount),
        txDate: _txDate,
        categoryType: _selectedCategoryType,
        primaryAccountId: _selectedFromAccount,
        categoryId: _selectedExpenseCategory,
      ));
      return;
    }

    if (_selectedCategoryType == CategoryType.income) {
      if (_selectedIncomeCategory == -1) {
        throw UserInputException('Expense Category is not selected!');
      }

      if (_selectedFromAccount == -1) {
        throw UserInputException('Account is not seleted!');
      }

      DataStore.addTx(Transaction(
        description: descController.text,
        amount: double.parse(amount),
        txDate: _txDate,
        categoryType: _selectedCategoryType,
        primaryAccountId: _selectedFromAccount,
        categoryId: _selectedIncomeCategory,
      ));
      return;
    }

    if (_selectedCategoryType == CategoryType.transfer) {
      if (_selectedFromAccount == -1) {
        throw UserInputException('From Account is not seleted!');
      }

      if (_selectedToAccount == -1) {
        throw UserInputException('To Account is not seleted!');
      }

      DataStore.addTx(Transaction(
        description: descController.text,
        amount: double.parse(amount),
        txDate: _txDate,
        categoryType: _selectedCategoryType,
        primaryAccountId: _selectedFromAccount,
        secondaryAccountId: _selectedToAccount,
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = GlobalKey<ScaffoldState>();

    var dropDown = DropdownButtonHideUnderline(
      child: DropdownButton(
          value: _selectedCategoryType,
          items: [
            DropdownMenuItem(
                child: Text('Expense'), value: CategoryType.expense),
            DropdownMenuItem(child: Text('Income'), value: CategoryType.income),
            DropdownMenuItem(
                child: Text('Transfer'), value: CategoryType.transfer)
          ],
          onChanged: (currentSelectedItem) {
            setState(() {
              _selectedCategoryType = currentSelectedItem;
              _resetSelectedItems();
            });
          }),
    );

    return Scaffold(
      key: _scaffoldKey,
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
              if (_selectedCategoryType != CategoryType.transfer)
                Text(
                  'Select Category',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              if (_selectedCategoryType != CategoryType.transfer)
                Container(
                  height: 250,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    childAspectRatio: 3 / 2,
                    crossAxisCount: 2,
                    children: [
                      ...(_selectedCategoryType == CategoryType.expense)
                          ? (DataStore.getCategories(CategoryType.expense)
                              .map((category) {
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
                                  Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.5),
                                ),
                              );
                            }))
                          : (DataStore.getCategories(CategoryType.income)
                              .map((category) {
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
                                  Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.5),
                                ),
                              );
                            }))
                    ],
                  ),
                ),
              if (_selectedCategoryType != CategoryType.transfer)
                SizedBox(height: 10),
              Text(
                (_selectedCategoryType != CategoryType.transfer)
                    ? 'Select Account'
                    : 'Select From Account',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...DataStore.getAccounts.map((account) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedFromAccount = account.id;
                          });
                        },
                        child: ListViewTextItem(
                          account.title,
                          _selectedFromAccount == account.id,
                        ),
                      );
                    })
                  ],
                ),
              ),
              SizedBox(height: 10),
              if (_selectedCategoryType == CategoryType.transfer)
                Text(
                  'Select To Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              SizedBox(height: 10),
              if (_selectedCategoryType == CategoryType.transfer)
                Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...DataStore.getAccounts.map((account) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedToAccount = account.id;
                            });
                          },
                          child: ListViewTextItem(
                            account.title,
                            (_selectedToAccount == account.id),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              if (_selectedCategoryType == CategoryType.transfer)
                SizedBox(height: 10),
              DateTimePicker(
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
                initialValue: DateTime.now().toString(),
                decoration: InputDecoration(
                  labelText: 'Transaction Date',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                onChanged: (selectedDate) {
                  setState(() {
                    _txDate = DateTime.parse(selectedDate);
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(
                      Icons.message,
                    )),
                controller: descController,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    height: 60,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Theme.of(context).accentColor.withOpacity(0.8),
                      ),
                    ),
                    color: Colors.grey[300],
                    minWidth: MediaQuery.of(context).size.width / 2,
                  ),
                  FlatButton(
                    height: 60,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    color: Theme.of(context).accentColor.withOpacity(0.8),
                    minWidth: MediaQuery.of(context).size.width / 2,
                    onPressed: () {
                      try {
                        saveTransaction();
                        Navigator.of(context).pop(true);
                      } on UserInputException catch (e) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(e.cause),
                        ));
                      }
                    },
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
