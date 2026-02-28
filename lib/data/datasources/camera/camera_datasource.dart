import 'dart:io';

abstract class CameraDatasource {
  Future<File?> getFileFromCamera();
}
