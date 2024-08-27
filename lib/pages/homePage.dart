import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riders/components/TButton.dart';
import 'package:riders/components/TDrawer.dart';
import 'package:riders/components/TTextField.dart';
import 'package:riders/pages/transportSelectionPage.dart';
import 'package:riders/utilities/constants.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/homePage';
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const TDrawer(),
      body: Stack(
        children: [
          // OpenStreetMap
          FlutterMap(
            options: MapOptions(
              center: LatLng(-1.9515333, 30.1146561), // Set initial map center
              zoom: 18.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  // Inner green circle marker
                  Marker(
                    point: LatLng(-1.9515333, 30.1146561),
                    width: 180.0,
                    height: 180.0,
                    builder: (ctx) => CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 190, 240, 218)
                          .withOpacity(0.5),
                      radius: 15.0, // Adjust radius for desired size
                      child: const SizedBox(),
                      // Empty child to prevent content rendering
                    ),
                  ),

                  // Outer yellow circle marker with location icon
                  Marker(
                    point: LatLng(-1.9515333, 30.1146561),
                    width: 80.0,
                    height: 80.0,
                    builder: (ctx) => Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 155, 236, 209)
                                  .withOpacity(0.7),
                          radius: 50.0, // Adjust radius for desired size
                        ),
                        const Center(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 70,
            left: 20,
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: IconButton(
                    iconSize: 24,
                    icon: const Icon(
                      CupertinoIcons.bars,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // open my TusifuDrawer
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ),
                const SizedBox(
                  width: 280,
                ),
                Container(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: IconButton(
                    iconSize: 24,
                    icon: const Icon(
                      CupertinoIcons.bell,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 170,
                    child: TButton(
                      label: "Rental",
                      onPressed: () {
                        // open Tusifu pick address modal

                        showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) =>
                              const CupertinoPopupSurface(
                            isSurfacePainted: true,
                            child: SelectAddressPopup(),
                          ),
                        );
                      },
                    ),
                  ),
                  smallSpacing,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        CupertinoTextField(
                          controller: searchController,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 14),
                          placeholder:
                              "Where would you go ?", // Show label as placeholder if not focused
                          prefix: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(CupertinoIcons.search),
                          ),
                          suffix: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(CupertinoIcons.heart),
                          ),
                          style: const TextStyle(fontSize: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 217, 245, 235),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        smallSpacing,
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        const CupertinoPopupSurface(
                                      isSurfacePainted: true,
                                      child: SelectAddressPopup(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Transport',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        const CupertinoPopupSurface(
                                      isSurfacePainted: true,
                                      child: SelectAddressPopup(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 217, 245, 235),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Delivery',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tag),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: const Color.fromARGB(255, 32, 31, 31),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: HomePage()));

class SelectAddressPopup extends StatefulWidget {
  const SelectAddressPopup({super.key});

  @override
  State<SelectAddressPopup> createState() => _SelectAddressPopupState();
}

class _SelectAddressPopupState extends State<SelectAddressPopup> {
  TextEditingController fromController = TextEditingController();

  TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallSpacing,
            // Handle
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 100,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            normalSpacing,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Select address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Form fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TTextField(
                    labelText: "From",
                    controller: fromController,
                  ),
                  smallSpacing,
                  TTextField(
                    labelText: "To",
                    controller: toController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Recent places
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recent places',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(CupertinoIcons.location_solid),
                    title: const Text('Office'),
                    subtitle: const Text(
                      'Kigali, Nyarugenge, Kigali, Ruriba',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: const Text('4.7km'),
                    onTap: () {
                      Navigator.of(context).pop();
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) =>
                            const CupertinoPopupSurface(
                          isSurfacePainted: true,
                          child: ConfirmSelectAddressPopup(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(CupertinoIcons.location_solid),
                    title: const Text('Coffee shop'),
                    subtitle: const Text(
                      'Kigali, Gasabo, Kacyiru, Kibaza, Amahoro',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: const Text('5.1km'),
                    onTap: () {
                      Navigator.of(context).pop();
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) =>
                            const CupertinoPopupSurface(
                          isSurfacePainted: true,
                          child: ConfirmSelectAddressPopup(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TButton(
                        label: "Choose Location",
                        onPressed: () {
                          Navigator.of(context).pop();
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                const CupertinoPopupSurface(
                              isSurfacePainted: true,
                              child: ConfirmSelectAddressPopup(),
                            ),
                          );
                        }),
                  ),
                  bigSpacing,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmSelectAddressPopup extends StatefulWidget {
  const ConfirmSelectAddressPopup({super.key});

  @override
  State<ConfirmSelectAddressPopup> createState() =>
      _ConfirmSelectAddressPopupState();
}

class _ConfirmSelectAddressPopupState extends State<ConfirmSelectAddressPopup> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallSpacing,
            // Handle
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 100,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            normalSpacing,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Select address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            const ListTile(
              leading: Icon(
                CupertinoIcons.location_solid,
                color: errorColor,
              ),
              title: Text('Current Location'),
              subtitle: Text(
                'Kigali, Nyarugenge, Kigali, Ruriba',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.location_solid,
                color: primaryColor,
              ),
              title: Text('Coffee shop'),
              subtitle: Text(
                'Kigali, Gasabo, Kacyiru, Kibaza, Amahoro',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '5.1km',
                style: TextStyle(color: Colors.black),
              ),
            ),
            bigSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TButton(
                  label: "Confirm Location",
                  onPressed: () {
                    Navigator.pushNamed(
                        context, TransportSelectionPage.routeName);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
