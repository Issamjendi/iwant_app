import 'package:flutter/material.dart';
import 'booking_screen.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  String selectedDate = 'Today';
  String selectedTime = '2:00 PM';

  final TextEditingController addressController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 10),

          const Text(
            'Select Date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              _dateChip('Today'),
              const SizedBox(width: 10),
              _dateChip('Tomorrow'),
              const SizedBox(width: 10),
              _dateChip('Pick Date'),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Select Time',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              _timeChip('10:00 AM'),
              const SizedBox(width: 10),
              _timeChip('2:00 PM'),
              const SizedBox(width: 10),
              _timeChip('6:00 PM'),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Address',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: addressController,
            decoration: InputDecoration(
              hintText: 'Enter your address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Additional Notes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: noteController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Optional details...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingScreen(),
                  ),
                );
              },
              child: const Text('Confirm Booking'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedDate == label,
      onSelected: (_) {
        setState(() {
          selectedDate = label;
        });
      },
    );
  }

  Widget _timeChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedTime == label,
      onSelected: (_) {
        setState(() {
          selectedTime = label;
        });
      },
    );
  }
}