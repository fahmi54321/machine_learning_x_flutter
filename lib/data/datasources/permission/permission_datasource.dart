import 'package:permission_handler/permission_handler.dart';

abstract class PermissionDatasource {
  Future<PermissionStatus> reqPermissionCamera();

  Future<PermissionStatus> reqPermissionFile();

  Future<PermissionStatus> cekPermissionCamera();

  Future<PermissionStatus> cekPermissionFile();
}
