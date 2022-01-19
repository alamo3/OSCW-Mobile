import 'package:flutter/material.dart';
import 'package:oscw_mobile_app/services/notification_manager.dart';
import 'pages/settings.dart';
import 'pages/notifications_main.dart';
import 'services/settings_manager.dart';
import 'pages/loading.dart';




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

  final SettingsManager _settingsManager = SettingsManager();
  final NotificationManager _notificationManager = NotificationManager();

  int selected_page = 0;

  bool bLoading = true;

  @override
  void initState()
  {
    _settingsManager.getPreferences((){
      _notificationManager.fetchNotificationsFromServer((){
        setState(() {
          bLoading = false;
        });
      });
    });
  }

  Widget create_page()
  {
    if(bLoading){
      return Loading();
    }

    switch(selected_page)
    {
      case 0:
       return NotificationsPage();

      case 1:
        return Center(child: Text('Live Camera'),);

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

    Icon notificationIcon = _notificationManager.getNumNotifs() != 0 ? Icon(Icons.notification_important) : Icon(Icons.notifications);

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
        items: [
          BottomNavigationBarItem(
            icon: notificationIcon,
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_sharp),
            label: 'Cameras',
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




