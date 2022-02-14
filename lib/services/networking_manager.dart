import 'dart:convert';

import 'package:oscw_mobile_app/services/settings_manager.dart';
import 'package:http/http.dart';

class NetworkingManager
{
  static late final SettingsManager _settingsManager;

  NetworkingManager._privateConstructor()
  {
    _settingsManager = SettingsManager();
  }

  static final NetworkingManager _networkingManager = NetworkingManager._privateConstructor();

  factory NetworkingManager()
  {
    return _networkingManager;
  }

  Future<bool> testServerConnection() async
  {
    try {
      Uri serverURL = Uri.parse('http://'+_settingsManager.serverIP+':'+_settingsManager.serverPort.toString());

      print(serverURL.port);
      print(serverURL.host);
      Response response = await get(serverURL).timeout(Duration(seconds: 20));

      Map data = jsonDecode(response.body);

      String success = data['success'];

      return success == 'true';

    }catch(exception)
    {
      print(exception.toString());
    }

    return false;
  }

}