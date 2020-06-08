import 'package:flutter/material.dart';
import 'package:music_app_ui/screens/home_screen.dart';
import 'package:music_app_ui/widgets/custom_icon.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  List _pageList = [
    HomePage(),
    Scaffold(body: Center(child: Text("Hi There Page 2"))),
    Scaffold(body: Center(child: Text("Hi There Page 3"))),
    Scaffold(body: Center(child: Text("Hi There Page 4"))),
  ];

  int _selectedIndex = 0;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent.withOpacity(.8),
        elevation: 0.0,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: CustomIcon(
              child: Icon(
                Icons.home,
                size: 40,
              ),
            ),
            title: Text(''),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(
              Icons.add_circle,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(
              Icons.favorite,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
