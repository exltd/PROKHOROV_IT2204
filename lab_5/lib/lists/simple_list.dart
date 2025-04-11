import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Список элементов', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('0000')),
          Divider(),
          ListTile(title: Text('0001')),
          Divider(),
          ListTile(title: Text('0010')),
        ],
      ),
    );
  }
}
