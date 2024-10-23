import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:tijaabo/stateles.dart';

import 'home.dart';
import 'profile.dart'; // Import for SetState Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0; // Track the selected page index

  // Define the pages to navigate to
  final List<Widget> pages = [
    MyHomePage(), // Your custom HomePage
    const SetstateView(), // Your custom SetState view
    Profile(), // Your custom Profile page
  ];

  // Update currentPageIndex based on the tapped item
  void onTabTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: Colors.white,

        currentIndex: currentPageIndex, // Highlight the current page
        onTap: onTabTapped, // Call onTabTapped when an item is tapped
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.filter2), label: "Chart"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile), label: "Profile"),
        ],
      ),
    );
  }
}
