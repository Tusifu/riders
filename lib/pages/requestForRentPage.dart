import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riders/components/TBackButton.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/pages/successPage.dart';
import 'package:riders/utilities/constants.dart';

class RequestForRentPage extends StatelessWidget {
  static const String routeName = '/requestForRent';
  const RequestForRentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const Text(
          'Request for rent',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationRow(
              icon: CupertinoIcons.location_solid,
              color: Colors.red,
              title: 'Current location',
              subtitle: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
            ),
            _buildLocationRow(
              icon: CupertinoIcons.location_solid,
              color: primaryColor,
              title: 'Office',
              subtitle: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
              trailing: const Text(
                '1.1km',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            smallSpacing,
            _buildCarDetails(),
            smallSpacing,
            const Text(
              'Charge',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            _buildChargeRow('Mustang/per hours', '\$200'),
            _buildChargeRow('Vat (5%)', '\$20'),
            const SizedBox(height: 16),
            const Text(
              'Select payment method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            smallSpacing,
            _buildPaymentMethod('assets/images/visa.png', '**** **** **** 8970',
                'Expires: 12/26'),
            _buildPaymentMethod('assets/images/mastercard.png',
                '**** **** **** 8970', 'Expires: 12/26'),
            _buildPaymentMethod('assets/images/paypal.png',
                'mailaddress@mail.com', 'Expires: 12/26'),
            _buildPaymentMethod(
                'assets/images/s.png', 'Cash', 'Expires: 12/26'),
            normalSpacing,
            SizedBox(
              width: double.infinity,
              child: TButton(
                  label: "Confirm",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Successpage.routeName,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildCarDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mustang Shelby GT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  Text(
                    '4.9',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '(531 reviews)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Image.asset(
            'assets/images/car2.png',
            width: 100,
            height: 60,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildChargeRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          Text(
            amount,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(String iconPath, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: primaryColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 45,
            height: 35,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
