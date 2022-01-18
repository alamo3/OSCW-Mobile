import 'package:flutter/material.dart';
import 'package:oscw_mobile_app/services/notification_manager.dart';
import 'package:oscw_mobile_app/widgets/notification_types.dart';
import 'package:oscw_mobile_app/widgets/Notification.dart';

class NotificationsPage extends StatefulWidget {

  late NotificationManager notificationManager;

  NotificationsPage(this.notificationManager);



  @override
  _NotificationsPageState createState() => _NotificationsPageState(notificationManager);
}

class _NotificationsPageState extends State<NotificationsPage> {

  late NotificationManager notificationManager;
  List notifications = [];

  _NotificationsPageState(this.notificationManager);

  void updateNotifications()
  {
    notifications = notificationManager.getNotificationsList();
  }

  @override
  Widget build(BuildContext context) {
    updateNotifications();

    return Container(
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){ setState(() {
              notificationManager.removeNotification(index);
              updateNotifications();
            });
            },
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text( notifications[index].notificationText, style: TextStyle(color: Colors.white),),
              ),
            ),
          );
      }),
    );
  }
}
