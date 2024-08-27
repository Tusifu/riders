import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/pages/requestForRentPage.dart';
import 'package:riders/pages/successPage.dart';
import 'package:riders/utilities/constants.dart';

class CarDetailsPage extends StatelessWidget {
  static const String routeName = '/carDetailsPage';
  final List<String> carImages = [
    'assets/images/car2.png',
    'assets/images/car1.png',
  ];

  CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mustang Shelby GT',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  '4.9 (531 reviews)',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            smallSpacing,
            CarouselSlider(
              options: CarouselOptions(
                height: 125,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 5),
              ),
              items: carImages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Specifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSpecificationCard(Icons.bolt, 'Max. power', '2500hp'),
                _buildSpecificationCard(
                    Icons.local_gas_station, 'Fuel', '10km per litre'),
                _buildSpecificationCard(Icons.speed, 'Max. speed', '230kph'),
                _buildSpecificationCard(Icons.timer, '0-60mph', '2.5sec'),
              ],
            ),
            smallSpacing,
            const Text(
              'Car features',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            _buildFeatureRow('Model', 'GT5000'),
            _buildFeatureRow('Capacity', '760hp'),
            _buildFeatureRow('Color', 'Red'),
            _buildFeatureRow('Fuel type', 'Octane'),
            _buildFeatureRow('Gear type', 'Automatic'),
            smallSpacing,
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Book later',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RequestForRentPage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Ride Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecificationCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(9),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.black54,
            size: 20,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 8),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String feature, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            feature,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
