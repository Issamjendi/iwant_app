import 'package:flutter/material.dart';

class FreelancerDashboardScreen extends StatelessWidget {
  const FreelancerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pendingRequests = [
      {
        'name': 'Ahmad K.',
        'service': 'AC Repair',
        'location': 'Mina, Tripoli',
        'time': 'Today, 2:00 PM',
      },
    ];

    final upcomingAppointments = [
      {
        'name': 'Sarah L.',
        'service': 'House Cleaning',
        'time': 'Tomorrow, 9:00 AM',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                child: Icon(Icons.person, size: 30),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome back, Jad',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Online for orders',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                child: _StatCard(
                  title: 'Earnings',
                  value: '\$450',
                  icon: Icons.account_balance_wallet_outlined,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Jobs Done',
                  value: '12',
                  icon: Icons.check_circle_outline,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Rating',
                  value: '4.8',
                  icon: Icons.star_border,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'Pending Requests',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          ...pendingRequests.map(
            (request) => Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request['time']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      request['name']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(request['service']!),
                    const SizedBox(height: 4),
                    Text(
                      request['location']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Decline'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Accept'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Upcoming Appointments',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          ...upcomingAppointments.map(
            (item) => Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.calendar_month),
                ),
                title: Text(
                  item['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${item['service']} • ${item['time']}'),
                trailing: const Icon(Icons.call_outlined),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Quick Actions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            children: const [
              _QuickActionCard(
                icon: Icons.edit_calendar,
                title: 'Update Availability',
              ),
              _QuickActionCard(
                icon: Icons.design_services,
                title: 'My Services',
              ),
              _QuickActionCard(
                icon: Icons.wallet_outlined,
                title: 'Wallet',
              ),
              _QuickActionCard(
                icon: Icons.support_agent,
                title: 'Support',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey.shade700),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _QuickActionCard({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 26,
            child: Icon(icon),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}