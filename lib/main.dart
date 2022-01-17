import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'OSCW Mobile Companion',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OSCW Mobile Companion'),
        backgroundColor: Colors.black38,
      ),

      body: Container(
        color: Colors.black45,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_sharp),
            label: 'Camera Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.cyan[400],
        unselectedItemColor: Colors.white54,
      ),
    );
  }
}




