import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tijaabo/log/login.dart';

import 'package:tijaabo/stateles.dart';

import 'home.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    MyHomePage(),
    const SetstateView(),
    Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: Colors.white,
        currentIndex: currentPageIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.category), label: "Chart"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile), label: "Profile"),
        ],
      ),
    );
  }
}
