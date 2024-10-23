import 'package:flutter/material.dart';

class SetstateView extends StatefulWidget {
  const SetstateView({super.key});

  @override
  State<SetstateView> createState() => _SetstateViewState();
}

class _SetstateViewState extends State<SetstateView> {
  List colors = [1, 2, 3, 4, 5, 6]; // Example List
  int? _selectedIndex; // Tracks the index of the selected item

  void _selectItem(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = null; // Deselect if already selected
      } else {
        _selectedIndex = index; // Select the clicked item
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("Setstate"),
      ),
      body: Column(
        children: [
          for (int i = 0; i < colors.length; i++)
            GestureDetector(
              onTap: () {
                _selectItem(i);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: _selectedIndex == i ? Colors.grey : Colors.red,
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  height: 80,
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  child: Center(
                    child: Text(
                      'Item ${colors[i]}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
