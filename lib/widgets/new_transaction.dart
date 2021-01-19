import 'package:flutter/material.dart';
import 'package:xpenso/constants/category_type.dart';
import 'package:xpenso/utility/data_store.dart';

import 'grid_view_item.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var currentSelected = CategoryType.expense;

  var accounts = DataStore.getCategories
      .map((account) => GridViewItem(account, false, null));

  var expenseCategories = DataStore.getCategories
      .map((category) => GridViewItem(category, false, null));

  var incomeCategories = DataStore.getCategories
      .map((category) => GridViewItem(category, false, null));

  var _formKey = GlobalKey<FormState>();
  var amountController;
  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(text: '0');
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
                      ...((currentSelected == CategoryType.expense)
                          ? expenseCategories
                          : incomeCategories)
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
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [...accounts],
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
              if (currentSelected == CategoryType.transfer)
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
