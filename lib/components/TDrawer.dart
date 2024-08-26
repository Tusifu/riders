import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riders/providers/authProvider.dart';
import 'package:riders/utilities/constants.dart';

class TDrawer extends StatelessWidget {
  const TDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TDrawerClipper(),
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        AssetImage('assets/images/user_avatar.png'),
                  ),
                  smallSpacing,
                  Text(
                    'Nate Samson',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'nate@email.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              dense: true,
              leading: const Icon(Icons.report_problem),
              title: const Text('Complain'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              dense: true,
              leading: const Icon(Icons.people),
              title: const Text('Referral'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              dense: true,
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              dense: true,
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              dense: true,
              leading: const Icon(Icons.help),
              title: const Text('Help and Support'),
              onTap: () {},
            ),
            const Divider(),
            Consumer<AuthProvider>(builder: (context, authProvider, child) {
              return ListTile(
                dense: true,
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  await authProvider.logout(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class TDrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from the top left corner
    path.lineTo(0, 0);

    // Create the top curve
    path.quadraticBezierTo(
      0,
      0,
      0,
      0,
    );

    // Line to the top right corner
    path.lineTo(size.width - 120, 0);

    // Create the top right curve
    path.quadraticBezierTo(
      size.width,
      0,
      size.width,
      120,
    );

    path.lineTo(size.width, size.height - 120);

    // Create the bottom right curve
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - 120,
      size.height,
    );

    // Line to the bottom left corner
    path.lineTo(0, size.height);

    // Create the bottom left curve
    path.quadraticBezierTo(
      0,
      size.height,
      0,
      size.height - 0,
    );

    // Close the path
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
