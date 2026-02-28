import 'dart:io';

abstract class CameraResult {}

class CameraSuccess extends CameraResult {
  final File file;
  CameraSuccess(this.file);
}

class CameraCanceled extends CameraResult {}
