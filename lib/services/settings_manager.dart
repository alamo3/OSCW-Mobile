import 'package:shared_preferences/shared_preferences.dart';

class SettingsManager
{
  SettingsManager._privateConstructor();

  static final SettingsManager _instance = SettingsManager._privateConstructor();

  factory SettingsManager()
  {
    return _instance;
  }

  String _serverIP = '';
  int _serverPort = 0;

  late final SharedPreferences _prefs;

  bool bLoaded = false;

  void setServerIP(String ip)
  {
    _serverIP = ip;
    _prefs.setString('server_ip', serverIP);
  }

  void setServerPort(int port)
  {
    _serverPort = port;
    _prefs.setInt('server_port', port);
  }

  void getPreferences(Function callback) async
  {
    _prefs = await SharedPreferences.getInstance();
    bLoaded = true;
    callback();

    _serverIP = _prefs.getString('server_ip') ?? '';
    _serverPort = _prefs.getInt('server_port') ?? 0;
  }

  int get serverPort => _serverPort;

  String get serverIP => _serverIP;
}