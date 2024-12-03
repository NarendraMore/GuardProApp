import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertPreviewScreen extends StatelessWidget {
  const AlertPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Preview'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/dashboard'); // Navigate to the DashboardScreen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alert Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: Icon(Icons.person_off),
              title: Text('Unknown Person Detected'),
              subtitle: Text('Date: 25 Nov 2024, Time: 1:37 PM'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'An unknown person was detected near the main entrance. Immediate action may be required.',
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) => ChatWindow(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Take Action'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for the keyboard
      ),
      child: Container(
        height: 400, // Adjust the height as needed
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Chat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('User: Hello!'),
                    subtitle: Text('1:38 PM'),
                  ),
                  ListTile(
                    title: Text('Support: How can I assist you?'),
                    subtitle: Text('1:39 PM'),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Handle sending a message
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
