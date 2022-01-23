import 'package:oscw_mobile_app/widgets/remote_camera.dart';

class RemoteCameraManager
{

  late int _numCams;
  List _cameras = <RemoteCamera>[];

  RemoteCameraManager._privateConstructor();

  static final RemoteCameraManager _cameraManager = RemoteCameraManager._privateConstructor();

  factory RemoteCameraManager()
  {
    return _cameraManager;
  }

  void createCamera(int cameraID, String cameraName)
  {
    _cameras.add(RemoteCamera(cameraID: cameraID, cameraName: cameraName));
  }

  int get numCams => _numCams;

  RemoteCamera getCamera(int index)
  {
    return (index >= 0 && index <_cameras.length ) ? _cameras[index] : null;
  }


}