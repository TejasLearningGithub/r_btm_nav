import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomCurvedNavBarExFirst extends StatefulWidget {
  const BottomCurvedNavBarExFirst({Key? key}) : super(key: key);

  @override
  _BottomCurvedNavBarExFirstState createState() =>
      _BottomCurvedNavBarExFirstState();
}

class _BottomCurvedNavBarExFirstState extends State<BottomCurvedNavBarExFirst> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: _MiddleFABLocation(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Image.asset(
          height: 50,
          width: 50,
          'assets/Rupiyacoin.png',
          fit: BoxFit.fill,
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 76.0,
        items: [
          CurvedNavigationBarItem(
              icon: Icon(Icons.add, size: 30), label: "Add"),
          CurvedNavigationBarItem(
              icon: Icon(Icons.list, size: 30), label: "List"),
          CurvedNavigationBarItem(
              icon: Icon(Icons.call_split, size: 30), label: "Split"),
          CurvedNavigationBarItem(
              icon: Icon(Icons.perm_identity, size: 30), label: "User"),
        ],
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final CurvedNavigationBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiddleFABLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2;
    final double fabY = scaffoldGeometry.contentBottom -
        scaffoldGeometry.floatingActionButtonSize.height / 2;
    return Offset(fabX, fabY);
  }

  @override
  String toString() => 'FloatingActionButtonLocation.middle';
}
