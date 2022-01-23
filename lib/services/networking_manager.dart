import 'package:oscw_mobile_app/services/settings_manager.dart';

class NetworkingManager
{
  static late final SettingsManager settingsManager;

  NetworkingManager._privateConstructor()
  {
    settingsManager = SettingsManager();
  }

  static final NetworkingManager _networkingManager = NetworkingManager._privateConstructor();

  void testServerConnection()
  {

  }

}