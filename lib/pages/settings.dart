import 'package:flutter/material.dart';
import 'package:oscw_mobile_app/services/settings_manager.dart';

class SettingsPage extends StatefulWidget {


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  late bool testedConnection;
  late bool connectionTestSuccessful;

  late SettingsManager settingsManager;

  _SettingsPageState()
  {
    settingsManager = SettingsManager();
  }

  @override
  void initState()
  {
    connectionTestSuccessful = false;
    testedConnection = false;
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
                initialValue: '192.168.0.1',
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'Server IP',
                    hintText: 'xx.xx.xx.xx',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white54)
                ),
              ),
              
              const SizedBox(height: 15.0,),

              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'Server Port',
                    hintText: '0-65535',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white54)
                ),
              ),
              const SizedBox(height: 15.0,),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        testedConnection = true;
                        connectionTestSuccessful = true;
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
                        connectionTestSuccessful ? ('Connection Successful') : ('Could not establish connection'),
                        style: TextStyle(color: connectionTestSuccessful ? Colors.green: Colors.red),
                      ),
                    visible: testedConnection,
                  )
                ],
              ),

              
          ]
          ),
      ),
    );
  }
}
