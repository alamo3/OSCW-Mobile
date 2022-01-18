import 'package:oscw_mobile_app/widgets/Notification.dart';
import 'package:oscw_mobile_app/widgets/notification_types.dart';

import 'settings_manager.dart';

class NotificationManager{

  late SettingsManager settingsManager;

  List notifications = <ClientNotification>[];

  NotificationManager({required this.settingsManager});

  int getNumNotifs() { return notifications.length; }

  void fetchNotificationsFromServer(Function callback) async
  {
    //TODO: actually fetch
    await Future.delayed(Duration(seconds: 3));

    this.notifications = [];

    notifications.add(ClientNotification(notificationType: NotificationType.low, notificationText: 'Notif 1'));
    notifications.add(ClientNotification(notificationType: NotificationType.normal, notificationText: 'Normal notif 2'));
    notifications.add(ClientNotification(notificationType: NotificationType.urgent, notificationText: 'Urgent Notification 3'));

    callback();
  }

}