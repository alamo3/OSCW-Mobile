import 'package:flutter/material.dart';
import 'pages/settings.dart';

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

  int selected_page = 0;

  Widget create_page()
  {
    switch(selected_page)
    {
      case 0:
       return Center(child: Text('Notifications'),);

      case 1:
        return Center(child: Text('Camera Events'),);

      case 2:
        return SettingsPage();
    }

    return Container();
  }

  void onPageSelected(int index)
  {
    setState(() {
      selected_page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OSCW Mobile Companion'),
        backgroundColor: Colors.black38,
      ),

      body: Container(
        color: Colors.black87,
        child: create_page(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        elevation: 1,
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
        currentIndex: selected_page,
        onTap: onPageSelected,
      ),
    );
  }
}




