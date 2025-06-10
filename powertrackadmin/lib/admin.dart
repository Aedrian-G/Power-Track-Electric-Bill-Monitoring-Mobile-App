import 'package:electricbill/adminlog.dart';
import 'package:electricbill/devicetable.dart';
import 'package:electricbill/pricingtable.dart';
import 'package:electricbill/userstable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AdminProvider.dart';

class AdminHome extends StatefulWidget {
  final String email;

  const AdminHome({Key? key, required this.email}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _selectedIndex = 0; // Track the selected index

  final _screens = [
    UserTb(), // Define your home screen widget
    DevTb(), // Define your users screen widget
    PriceTb(), // Define your devices screen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: SafeArea(
              child: Image.asset(
                'lib/assets/longlogo.png',
                width: 200,
                height: 100,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Consumer<AdminProvider>(
          builder: (context, userProvider, _) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'lib/assets/mainlogo2.jpg'), // Set the path to your profile picture
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      Text(
                        '${userProvider.email ?? ''}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Users'),
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.devices),
                  title: Text('Devices'),
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text('Pricing'),
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    // Perform logout action here
                    // For example, you can clear the user data and navigate to the login page
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Admin()),
                      (route) => false,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Pricing',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
