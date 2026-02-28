import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/camera/camera_result.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/camera/camera_repository.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/camera/camera_usecase.dart';

class CameraUsecaseImpl implements CameraUsecase {
  final CameraRepository cameraRepository;
  CameraUsecaseImpl({required this.cameraRepository});
  @override
  Future<Either<Failure, CameraResult>> getFileFromCamera() {
    return cameraRepository.getFileFromCamera();
  }
}
