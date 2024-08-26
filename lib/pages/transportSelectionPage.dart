import 'package:flutter/material.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/utilities/constants.dart';

class TransportSelectionPage extends StatelessWidget {
  static const String routeName = '/selectTransportPage';
  const TransportSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        leadingWidth: 100,
        backgroundColor: backgroundColor,
        title: const Text(
          'Select Transport',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Select your transport',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TransportOption(
                  image: 'assets/images/car.png',
                  label: 'Car',
                  onSelect: (isSelected) {
                    // Handle car selection here
                    print('Car selected: $isSelected');
                  },
                ),
                TransportOption(
                  image: 'assets/images/bike.png',
                  label: 'Bike',
                  onSelect: (isSelected) {
                    // Handle bike selection here
                    print('Bike selected: $isSelected');
                  },
                ),
                TransportOption(
                  image: 'assets/images/cycle.png',
                  label: 'Cycle',
                  onSelect: (isSelected) {
                    // Handle cycle selection here
                    print('Cycle selected: $isSelected');
                  },
                ),
                TransportOption(
                  image: 'assets/images/taxi.png',
                  label: 'Taxi',
                  onSelect: (isSelected) {
                    // Handle taxi selection here
                    print('Taxi selected: $isSelected');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransportOption extends StatefulWidget {
  final String image;
  final String label;
  final Function(bool) onSelect; // Callback for selection change

  const TransportOption({
    super.key,
    required this.image,
    required this.label,
    required this.onSelect,
  });

  @override
  State<TransportOption> createState() => _TransportOptionState();
}

class _TransportOptionState extends State<TransportOption> {
  bool isSelected = false;

  static bool _isAnyOptionSelected = false; // Track if any option is selected

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_isAnyOptionSelected) {
          setState(() {
            isSelected = true;
            _isAnyOptionSelected = true;
            widget.onSelect(isSelected); // Call callback with selection state
          });
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: isSelected
              ? const BorderSide(color: Colors.green, width: 0.5)
              : const BorderSide(color: Colors.black, width: 0.5),
        ),
        color: isSelected
            ? const Color.fromARGB(255, 230, 241, 230)
            : Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 8),
            Text(widget.label),
          ],
        ),
      ),
    );
  }
}
