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
            title: Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('Accounts'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/accounts');
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
