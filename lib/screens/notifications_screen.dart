import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Booking Confirmed',
        'subtitle': 'Your plumbing service is scheduled for today at 4PM',
        'time': '2 min ago',
        'icon': Icons.check_circle,
        'color': Colors.green,
      },
      {
        'title': 'New Message',
        'subtitle': 'Ahmad K. sent you a message',
        'time': '10 min ago',
        'icon': Icons.chat_bubble,
        'color': Colors.blue,
      },
      {
        'title': 'Payment Successful',
        'subtitle': 'You paid \$20 for AC repair',
        'time': '1 hour ago',
        'icon': Icons.payment,
        'color': Colors.purple,
      },
      {
        'title': 'Reminder',
        'subtitle': 'Your booking starts in 30 minutes',
        'time': '2 hours ago',
        'icon': Icons.alarm,
        'color': Colors.orange,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: notifications.isEmpty
          ? const _EmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final n = notifications[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (n['color'] as Color).withOpacity(0.2),
                      child: Icon(
                        n['icon'] as IconData,
                        color: n['color'] as Color,
                      ),
                    ),
                    title: Text(
                      n['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(n['subtitle'] as String),
                    trailing: Text(
                      n['time'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.notifications_none, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No notifications yet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'You will see updates here',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}