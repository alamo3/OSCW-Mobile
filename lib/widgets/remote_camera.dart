import 'package:flutter/cupertino.dart';

class RemoteCamera
{

  late AssetImage _image;
  late int _camera_id;

  late String _camera_name;

  RemoteCamera({required int camera_id, required String camera_name})
  {
    _image = AssetImage('assets/camera.png');
    _camera_id = camera_id;
    _camera_name = camera_name;
  }

  Future<void> updateCameraImage() async
  {
    //TODO: actually fetch latest camera image
  }

  String get camera_name => _camera_name;

  int get camera_id => _camera_id;

  AssetImage get image => _image;
}