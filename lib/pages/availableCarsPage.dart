import 'package:flutter/material.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/utilities/constants.dart';

class AvailableCarsPage extends StatelessWidget {
  static const String routeName = '/availableCarsPage';
  const AvailableCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: backgroundColor,
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Available cars for ride",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            smallSpacing,
            const Text(
              '18 cars found',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of cards to display
                itemBuilder: (context, index) {
                  return const AvailableCarCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailableCarCard extends StatelessWidget {
  const AvailableCarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: primaryColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BMW Cabrio',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Automatic | 3 seats | Octane',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Colors.black, size: 16),
                          SizedBox(width: 4),
                          Text('800m (5mins away)',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/car1.png',
                  height: 55,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle "Book later" action
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: primaryColor, width: 1),
                      backgroundColor: Colors.white,
                      foregroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Book later'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle "Ride Now" action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Ride Now'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
