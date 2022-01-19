import 'package:oscw_mobile_app/widgets/Notification.dart';
import 'package:oscw_mobile_app/widgets/notification_types.dart';

import 'settings_manager.dart';

class NotificationManager{

  NotificationManager._privateConstructor()
  {
    settingsManager = SettingsManager();
  }

  late SettingsManager settingsManager;

  List notifications = <ClientNotification>[];

  late Function homeCallback;

  static final NotificationManager _notificationManager = NotificationManager._privateConstructor();

  factory NotificationManager()
  {
    return _notificationManager;
  }


  int getNumNotifs() { return notifications.length; }

  List getNotificationsList()
  {
    return notifications;
  }

  void fetchNotificationsFromServer(Function callback) async
  {
    assert(settingsManager.bLoaded);

    String serverIP = settingsManager.serverIP;
    int serverPort = settingsManager.serverPort;

    //TODO: actually fetch
    await Future.delayed(Duration(seconds: 3));

    this.notifications = [];

    notifications.add(ClientNotification(notificationType: NotificationType.low, notificationText: 'Notif 1'));
    notifications.add(ClientNotification(notificationType: NotificationType.normal, notificationText: 'Normal notif 2'));
    notifications.add(ClientNotification(notificationType: NotificationType.urgent, notificationText: 'Urgent Notification 3'));

    homeCallback = callback;

    callback();
  }

  void removeNotification(int index)
  {
    notifications.removeAt(index);
    homeCallback();
  }

}