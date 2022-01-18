import 'package:flutter/material.dart';
import 'package:oscw_mobile_app/widgets/notification_types.dart';
import 'package:oscw_mobile_app/widgets/Notification.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);


  
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  List notifications = <ClientNotification>[ClientNotification(notificationType: NotificationType.low, notificationText: 'Notif 1')];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){ setState(() {
              notifications.removeAt(index);
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
