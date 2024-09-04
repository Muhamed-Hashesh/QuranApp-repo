import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        ListTile(
          title: Text('إعدادات 1'),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          title: Text('إعدادات 2'),
          trailing: Icon(Icons.arrow_forward),
        ),
        // Add more settings items here
      ],
    );
  }
}
