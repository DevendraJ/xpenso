import 'package:flutter/material.dart';
import 'package:xpenso/utility/data_store.dart';

class AccountList extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
  var _accounts = DataStore.getAccounts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accounts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AccountDialog();
                  }).then((_) {
                setState(() {
                  _accounts = DataStore.getAccounts;
                });
              });
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            ..._accounts.map((account) {
              return Card(
                child: ListTile(
                  title: Text(account.title),
                  subtitle: Text(
                    'Current Balance: ${account.currBalance}',
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class AccountDialog extends StatelessWidget {
  final nameController = TextEditingController();
  final amountController = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: Text("Enter Account Details"),
      content: Container(
        width: 250,
        height: 200,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textCapitalization: TextCapitalization.words,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'Account Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Account name cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: amountController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Account Balance',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Account balance cannot be empty';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.grey,
        ),
        RaisedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              DataStore.addAccount(Account(
                title: nameController.text,
                currBalance: double.parse(amountController.text),
              ));
              Navigator.of(context).pop();
            }
          },
          child: Text(
            'Add',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green[300],
        )
      ],
    );
  }
}
