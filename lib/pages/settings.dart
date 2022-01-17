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
            children: const [
              Text('Server IP:', style: TextStyle(color: Colors.white),),
              SizedBox(height: 10.0,),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Server IP',
                  hintText: 'Public IP Address of the OSCW desktop server'
                ),
              ),
              SizedBox(height: 15.0,),
              Text('Server Port:', style: TextStyle(color: Colors.white),),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Server Port',
                  hintText: 'Port of the OSCW desktop server'
                ),
              )
          ]
          ),
      ),
    );
  }
}
