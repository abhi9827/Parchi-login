import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.school_sharp),
              title: Text('Leave Request'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Exam'),
          ),
          ListTile(
            leading: Icon(Icons.pool),
            title: Text('Swimming'),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Results'),
          ),
          ListTile(
            leading: Icon(Icons.library_add),
            title: Text('Library'),
          ),
        ],
      ),
    );
  }
}
