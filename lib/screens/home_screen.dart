import 'package:flutter/material.dart';
import 'freelancer_profile_screen.dart';
import 'search_results_screen.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Electrician',
        'icon': Icons.electrical_services,
      },
      {
        'title': 'Plumbing',
        'icon': Icons.plumbing,
      },
      {
        'title': 'Cleaning',
        'icon': Icons.cleaning_services,
      },
      {
        'title': 'Painting',
        'icon': Icons.format_paint,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('I Want'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationsScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              'Hello 👋',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Text(
              'Find the best service for your needs',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // SEARCH
            TextField(
              onSubmitted: (value) {
                if (value.isEmpty) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchResultsScreen(query: value),
                  ),
                );
              },
              decoration: const InputDecoration(
                hintText: 'Search services...',
                prefixIcon: Icon(Icons.search),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Popular Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: GridView.builder(
                itemCount: services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const FreelancerProfileScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 28,
                            child: Icon(service['icon'] as IconData),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            service['title'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}