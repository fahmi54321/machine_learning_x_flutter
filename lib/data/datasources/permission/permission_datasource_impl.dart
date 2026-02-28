import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:machine_learning_x_flutter/data/datasources/permission/permission_datasource.dart';

class PermissionDatasourceImpl implements PermissionDatasource {
  final DeviceInfoPlugin deviceInfoPlugin;

  PermissionDatasourceImpl({required this.deviceInfoPlugin});

  @override
  Future<PermissionStatus> reqPermissionCamera() async {
    try {
      return await Permission.camera.request();
    } catch (e) {
      log('error reqPermissionCamera $e');
      throw PermissionException('error');
    }
  }

  @override
  Future<PermissionStatus> cekPermissionCamera() async {
    try {
      return await Permission.camera.status;
    } catch (e) {
      log('error cekPermissionCamera $e');
      throw PermissionException('error');
    }
  }

  @override
  Future<PermissionStatus> reqPermissionFile() async {
    try {
      if (Platform.isIOS) {
        return await Permission.photos.request();
      }

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;

        if (androidInfo.version.sdkInt >= 33) {
          return await Permission.photos.request();
        } else {
          return await Permission.storage.request();
        }
      }

      return PermissionStatus.denied;
    } catch (e) {
      log('error reqPermissionFile $e');
      throw PermissionException('error');
    }
  }

  @override
  Future<PermissionStatus> cekPermissionFile() async {
    try {
      if (Platform.isIOS) {
        return await Permission.photos.status;
      }

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;

        if (androidInfo.version.sdkInt >= 33) {
          return await Permission.photos.status;
        } else {
          return await Permission.storage.status;
        }
      }

      return PermissionStatus.denied;
    } catch (e) {
      log('error cekPermissionFile $e');
      throw PermissionException('error');
    }
  }
}
