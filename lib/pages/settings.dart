import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: Container(
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const TextField(
                obscureText: false,
                decoration: InputDecoration(
                    labelText: 'Server IP',
                    hintText: 'xx.xx.xx.xx',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white54)
                ),
              ),
              
              SizedBox(height: 15.0,),

              const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: 'Server Port',
                    hintText: '0-65535',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white54)
                ),
              ),
              SizedBox(height: 15.0,),
              ElevatedButton(
                  onPressed: (){},
                  child: const Text('Test Connection'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black87)
                  ),

              ),
              
          ]
          ),
      ),
    );
  }
}
