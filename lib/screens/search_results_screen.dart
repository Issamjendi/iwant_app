import 'package:flutter/material.dart';
import 'freelancer_profile_screen.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;

  const SearchResultsScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for "$query"'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FreelancerCard(
            name: 'Ahmad K.',
            job: 'Electrician',
            rating: 4.9,
            price: 15,
          ),
          FreelancerCard(
            name: 'Ali M.',
            job: 'Electrician',
            rating: 4.7,
            price: 12,
          ),
        ],
      ),
    );
  }
}

class FreelancerCard extends StatelessWidget {
  final String name;
  final String job;
  final double rating;
  final double price;

  const FreelancerCard({
    super.key,
    required this.name,
    required this.job,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              child: Icon(Icons.person),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(job),
                  Text('⭐ $rating'),
                ],
              ),
            ),
            Column(
              children: [
                Text('\$$price/hr'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FreelancerProfileScreen(),
                      ),
                    );
                  },
                  child: const Text('View'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}