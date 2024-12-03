import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String datetime;
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.datetime,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(datetime),
        onTap: onTap,
      ),
    );
  }
}
