import 'package:oscw_mobile_app/widgets/remote_camera.dart';

class RemoteCameraManager
{

  late int _numCams;
  List _cameras = <RemoteCamera>[];

  RemoteCameraManager._privateConstructor(){
    _numCams = 0;
    addTestCameras();
  }

  static final RemoteCameraManager _cameraManager = RemoteCameraManager._privateConstructor();

  factory RemoteCameraManager()
  {
    return _cameraManager;
  }

  void createCamera(int cameraID, String cameraName)
  {
    _numCams++;
    _cameras.add(RemoteCamera(cameraID: cameraID, cameraName: cameraName));
  }

  int get numCams => _numCams;

  RemoteCamera getCamera(int index)
  {
    return (index >= 0 && index <_cameras.length ) ? _cameras[index] : null;
  }

  void addTestCameras()
  {
    createCamera(1, 'Front Camera');
    createCamera(2, 'Left Side Camera');
    createCamera(3, 'Right Side Camera');
    createCamera(4, 'Rear Camera');
  }


}