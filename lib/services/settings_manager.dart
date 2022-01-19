import 'package:shared_preferences/shared_preferences.dart';

class SettingsManager
{
  SettingsManager._privateConstructor();

  static final SettingsManager _instance = SettingsManager._privateConstructor();

  factory SettingsManager()
  {
    return _instance;
  }

  String serverIP = '';
  int serverPort = 0;

  late final SharedPreferences prefs;

  bool bLoaded = false;

  void setServerIP(String ip)
  {
    serverIP = ip;
    prefs.setString('server_ip', serverIP);
  }

  void setServerPort(int port)
  {
    serverPort = port;
    prefs.setInt('server_port', port);
  }

  void getPreferences(Function callback) async
  {
    prefs = await SharedPreferences.getInstance();
    bLoaded = true;
    callback();

    serverIP = prefs.getString('server_ip') ?? '';
    serverPort = prefs.getInt('server_port') ?? 0;
  }


}