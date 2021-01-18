import 'package:flutter/material.dart';
import 'package:xpenso/utility/data_store.dart';
import 'package:xpenso/widgets/grid_view_item.dart';

class ExpenseAndIncomeForm extends StatefulWidget {
  final bool isExpense;

  ExpenseAndIncomeForm({@required this.isExpense});

  @override
  _ExpenseAndIncomeFormState createState() => _ExpenseAndIncomeFormState();
}

class _ExpenseAndIncomeFormState extends State<ExpenseAndIncomeForm> {
  void doNothing() {}

  @override
  Widget build(BuildContext context) {
    var expenseCategories = DataStore.getCategories.map((category) {
      return GridViewItem(category, false, doNothing);
    });

    var incomeCategories = DataStore.getCategories.map((category) {
      return GridViewItem(category, false, doNothing);
    });

    var accounts = DataStore.getCategories.map((category) {
      return GridViewItem(category, false, doNothing);
    });

    void goBack() {
      Navigator.of(context).pop();
    }

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
              'Select Category',
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
                  ...(widget.isExpense ? expenseCategories : incomeCategories)
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
                    goBack();
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
}
