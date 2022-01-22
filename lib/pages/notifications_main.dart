import 'package:flutter/material.dart';
import 'package:oscw_mobile_app/services/notification_manager.dart';
import 'package:oscw_mobile_app/widgets/notification_types.dart';
import 'package:oscw_mobile_app/widgets/Notification.dart';

class NotificationsPage extends StatefulWidget {


  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  late NotificationManager _notificationManager;
  List _notifications = [];

  _NotificationsPageState()
  {
    _notificationManager = NotificationManager();
  }

  void updateNotifications()
  {
    _notifications = _notificationManager.getNotificationsList();
  }

  @override
  Widget build(BuildContext context) {
    updateNotifications();

    return Container(
      child: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index){

          late Icon notifIcon;

          switch(_notifications[index].notificationType)
          {
            case NotificationType.normal:
              notifIcon = Icon(Icons.notifications, color: Colors.grey,);
              break;

            case NotificationType.urgent:
              notifIcon = Icon(Icons.notification_important, color: Colors.red[400]);
              break;
          }

          return GestureDetector(
            onTap: (){ setState(() {
              _notificationManager.removeNotification(index);
              updateNotifications();
            });
            },
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    notifIcon,
                    SizedBox(width: 20.0,),
                    Text( _notifications[index].notificationText, style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
          );
      }),
    );
  }
}
