
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';


class BottomCurvedNavBarExFirst extends StatefulWidget {
  const BottomCurvedNavBarExFirst({Key? key}) : super(key: key);

  @override
  _BottomCurvedNavBarExFirstState createState() =>
      _BottomCurvedNavBarExFirstState();
}

class _BottomCurvedNavBarExFirstState
    extends State<BottomCurvedNavBarExFirst> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curved Navigation Bar Example'),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 56.0,
        items: <Widget>[
          CurvedNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          CurvedNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            activeIcon: Icon(Icons.search),
          ),
          CurvedNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            activeIcon: Icon(Icons.notifications_active),
          ),
          CurvedNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            activeIcon: Icon(Icons.person_outline),
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            'Selected Page: $_page',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
