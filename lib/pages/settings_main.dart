import 'package:flutter/material.dart';
import 'package:oscw_mobile_app/services/settings_manager.dart';

class SettingsPage extends StatefulWidget {


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  late bool _testedConnection;
  late bool _connectionTestSuccessful;

  late SettingsManager _settingsManager;

  _SettingsPageState()
  {
    _settingsManager = SettingsManager();
  }

  @override
  void initState()
  {
    _connectionTestSuccessful = false;
    _testedConnection = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: Container(
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextFormField(
                initialValue: _settingsManager.serverIP,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'Server IP',
                    hintText: 'xx.xx.xx.xx',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white54)
                ),

                onChanged: (text){
                  _settingsManager.setServerIP(text);
                },
              ),
              
              const SizedBox(height: 15.0,),

              TextFormField(
                initialValue: _settingsManager.serverPort.toString(),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'Server Port',
                    hintText: '0-65535',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white54)
                ),
                onChanged: (text){
                  _settingsManager.setServerPort(int.parse(text));
                },
              ),
              const SizedBox(height: 15.0,),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        _testedConnection = true;
                        _connectionTestSuccessful = true;
                      });
                    },
                    child: const Text('Test Connection'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black87)
                    ),

                  ),

                  SizedBox(width: 20.0,),
                  Visibility(
                      child: Text(
                        _connectionTestSuccessful ? ('Connection Successful') : ('Could not establish connection'),
                        style: TextStyle(color: _connectionTestSuccessful ? Colors.green: Colors.red),
                      ),
                    visible: _testedConnection,
                  )
                ],
              ),
          ]
          ),
      ),
    );
  }
}
