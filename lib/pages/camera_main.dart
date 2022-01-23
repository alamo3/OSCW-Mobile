import 'package:flutter/material.dart';
import 'package:oscw_mobile_app/services/camera_manager.dart';
import 'package:oscw_mobile_app/widgets/remote_camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  RemoteCameraManager _cameraManager = RemoteCameraManager();

  @override
  Widget build(BuildContext context) {

    List<Widget> cameras = [];

    for (int i =0; i < _cameraManager.numCams; i++)
    {

      RemoteCamera camera = _cameraManager.getCamera(i);
      Container container = Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image(image: camera.image,),
            SizedBox(height: 7.0,),
            Text(camera.cameraName, style: TextStyle(color: Colors.white54),)
          ],
        ),
      );

      cameras.add(container);
    }

    return Container(
        child: GridView.count(
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 2,
          children: cameras,
        ),
      );
  }
}
