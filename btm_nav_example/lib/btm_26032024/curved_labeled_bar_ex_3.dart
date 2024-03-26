import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomCurvedNavBarExThird extends StatefulWidget {
  const BottomCurvedNavBarExThird({Key? key}) : super(key: key);

  @override
  _BottomCurvedNavBarExThirdState createState() =>
      _BottomCurvedNavBarExThirdState();
}

class _BottomCurvedNavBarExThirdState extends State<BottomCurvedNavBarExThird> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool _showFab = true; // Flag to control FAB visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _showFab = _shouldShowFab(index); // Update FAB visibility
          });
        },
        letIndexChange: (index) => true,
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {
                // Add your FAB onPressed logic here
              },
              child: Icon(Icons.add),
            )
          : null, // Render FAB only if _showFab is true
      floatingActionButtonLocation: _MiddleFABLocation(), // Custom FAB location
      body: Stack(
        children: [
          Container(
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
        ],
      ),
    );
  }

  // Determine if FAB should be shown based on the selected index
  bool _shouldShowFab(int index) {
    // Define your logic here
    return true; // For demonstration, always show FAB
  }
}

// Custom FloatingActionButtonLocation to position FAB in the middle
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
