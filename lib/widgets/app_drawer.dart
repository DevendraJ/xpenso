import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Xpenso',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[300],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Accounts'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/accounts');
            },
          ),
          ListTile(
            leading: Icon(Icons.alternate_email),
            title: Text('About'),
            onTap: () {
              showAboutDialog(context: context);
            },
          ),
        ],
      ),
    );
  }
}
