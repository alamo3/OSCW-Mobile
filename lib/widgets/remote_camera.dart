import 'package:flutter/cupertino.dart';

class RemoteCamera
{

  late AssetImage _image;
  late int _cameraID;

  late String _cameraName;

  RemoteCamera({required int cameraID, required String cameraName})
  {
    _image = AssetImage('assets/camera.png');
    _cameraID = cameraID;
    _cameraName = cameraName;
  }

  Future<void> updateCameraImage() async
  {
    //TODO: actually fetch latest camera image
  }

  String get cameraName => _cameraName;

  int get cameraID => _cameraID;

  AssetImage get image => _image;
}