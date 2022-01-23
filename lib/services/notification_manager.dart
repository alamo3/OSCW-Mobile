import 'package:oscw_mobile_app/widgets/Notification.dart';
import 'package:oscw_mobile_app/widgets/notification_types.dart';

import 'settings_manager.dart';

class NotificationManager{

  NotificationManager._privateConstructor()
  {
    _settingsManager = SettingsManager();
  }

  late SettingsManager _settingsManager;

  List _notifications = <ClientNotification>[];

  late Function _homeCallback;

  static final NotificationManager _notificationManager = NotificationManager._privateConstructor();

  factory NotificationManager()
  {
    return _notificationManager;
  }


  int getNumNotifs() { return _notifications.length; }

  List getNotificationsList()
  {
    return _notifications;
  }

  void fetchNotificationsFromServer(Function callback) async
  {
    assert(_settingsManager.bLoaded);

    String serverIP = _settingsManager.serverIP;
    int serverPort = _settingsManager.serverPort;

    //TODO: actually fetch
    await Future.delayed(Duration(seconds: 3));

    this._notifications = [];

    _notifications.add(ClientNotification(notificationType: NotificationType.normal, notificationText: 'Notif 1'));
    _notifications.add(ClientNotification(notificationType: NotificationType.normal, notificationText: 'Normal notif 2'));
    _notifications.add(ClientNotification(notificationType: NotificationType.urgent, notificationText: 'Urgent Notification 3'));

    _homeCallback = callback;

    callback();
  }

  void removeNotification(int index)
  {
    _notifications.removeAt(index);
    _homeCallback();
  }

}