import 'package:flutter/material.dart';
import 'notification_types.dart';

class ClientNotification{

  late NotificationType _notificationType;

  late String _notificationText;

  ClientNotification({required NotificationType notificationType,required String notificationText})
  {
    this._notificationType = notificationType;
    this._notificationText = notificationText;
  }

  String get notificationText => _notificationText;

  NotificationType get notificationType => _notificationType;
}


