import 'package:flutter/material.dart';

class ReportIssueScreen extends StatefulWidget {
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  String selectedIssue = 'Service Problem';
  final TextEditingController descriptionController = TextEditingController();

  final List<String> issues = [
    'Service Problem',
    'Payment Issue',
    'Freelancer Behavior',
    'App Bug',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report an Issue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 10),

            const Text(
              'What is the issue?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            ...issues.map(
              (issue) => RadioListTile<String>(
                value: issue,
                groupValue: selectedIssue,
                title: Text(issue),
                onChanged: (value) {
                  setState(() {
                    selectedIssue = value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Describe the issue',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Explain what happened...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Issue reported successfully!'),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Submit Report'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}