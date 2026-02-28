import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/presentation/core/permission/permission_status.dart';

abstract class PermissionRepository {
  Future<Either<Failure, AskPermissionStatus>> reqPermissionCamera();

  Future<Either<Failure, AskPermissionStatus>> reqPermissionFile();

  Future<Either<Failure, AskPermissionStatus>> cekPermissionCamera();

  Future<Either<Failure, AskPermissionStatus>> cekPermissionFile();
}
