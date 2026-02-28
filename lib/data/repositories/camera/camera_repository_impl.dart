import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/data/datasources/camera/camera_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/domain/entities/camera/camera_result.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/camera/camera_repository.dart';

class CameraRepositoryImpl implements CameraRepository {
  final CameraDatasource cameraDatasource;

  CameraRepositoryImpl({required this.cameraDatasource});

  @override
  Future<Either<Failure, CameraResult>> getFileFromCamera() async {
    try {
      final result = await cameraDatasource.getFileFromCamera();

      if (result == null) {
        return right(CameraCanceled());
      }

      return right(CameraSuccess(result));
    } on PermissionException catch (e) {
      return Left(PermissionFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(ServerFailure('Error'));
    }
  }
}
