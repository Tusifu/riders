import 'package:flutter/material.dart';

class AvailableCarsPage extends StatelessWidget {
  const AvailableCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.red,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BMW Cabrio',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Automatic | 3 seats | Octane'),
                    Text('800m (5mins away)'),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Book later" action
                    print('Book later pressed');
                  },
                  child: const Text('Book later'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Ride Now" action
                    print('Ride Now pressed');
                  },
                  child: const Text('Ride Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
