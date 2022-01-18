import 'package:flutter/material.dart';
import 'package:oscw_mobile_app/services/notification_manager.dart';
import 'pages/settings.dart';
import 'pages/notifications_main.dart';
import 'services/settings_manager.dart';
import 'pages/loading.dart';

SettingsManager _settingsManager = SettingsManager();
NotificationManager _notificationManager = NotificationManager(settingsManager: _settingsManager);

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

  final NotificationsPage _notificationsPage = NotificationsPage();

  int selected_page = 0;

  bool bLoading = true;

  @override
  void initState()
  {
    _settingsManager.getPreferences((){setState(() {
        bLoading = false;
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
       return _notificationsPage;

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




