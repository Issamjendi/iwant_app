import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = []; // empty demo

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: messages.isEmpty
          ? const _EmptyChat()
          : ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('Message'),
                );
              },
            ),
    );
  }
}

class _EmptyChat extends StatelessWidget {
  const _EmptyChat();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.chat_bubble_outline,
              size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No messages yet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Start chatting with a freelancer',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}