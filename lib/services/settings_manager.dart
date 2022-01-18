import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SettingsManager
{

  late String serverIP;
  late int serverPort;

  late final SharedPreferences prefs;

  bool bLoaded = false;



  void getPreferences(Function callback) async
  {
    prefs = await SharedPreferences.getInstance();
    bLoaded = true;
    callback();

    serverIP = prefs.getString('server_ip') ?? '';
    serverPort = prefs.getInt('server_port') ?? 0;
  }


}