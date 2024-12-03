import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Notification 1'),
            subtitle: Text('Details about notification 1.'),
          ),
          ListTile(
            title: Text('Notification 2'),
            subtitle: Text('Details about notification 2.'),
          ),
          // Add more notifications as needed
        ],
      ),
    );
  }
}
