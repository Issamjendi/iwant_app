import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.book_online, 'title': 'My Bookings'},
      {'icon': Icons.favorite_border, 'title': 'Saved Freelancers'},
      {'icon': Icons.notifications_none, 'title': 'Notifications'},
      {'icon': Icons.language, 'title': 'Language'},
      {'icon': Icons.help_outline, 'title': 'Help & Support'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          const CircleAvatar(
            radius: 48,
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Walid A.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Center(
            child: Text(
              'Tripoli, Lebanon',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _ProfileStat(title: '12', subtitle: 'BOOKINGS'),
              _ProfileStat(title: '4.8', subtitle: 'REVIEWS'),
              _ProfileStat(title: '5', subtitle: 'SAVED'),
            ],
          ),
          const SizedBox(height: 28),
          ...items.map(
            (item) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(item['icon'] as IconData),
                title: Text(item['title'] as String),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ProfileStat({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}