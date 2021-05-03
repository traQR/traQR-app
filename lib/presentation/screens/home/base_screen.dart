import 'package:flutter/material.dart';
import 'package:traqr_app/presentation/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traqr_app/providers/auth_providers.dart';

import 'home_screen.dart';
import 'scan_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ScanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _auth = watch(authServicesProvider);
      return Scaffold(
        appBar: AppBar(
          title: Text("traQR"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
              ),
              onPressed: () => _auth.signOut(),
            )
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Scan',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: pink,
          onTap: _onItemTapped,
        ),
      );
    });
  }
}
