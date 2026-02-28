import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/camera/camera_result.dart';

import 'package:machine_learning_x_flutter/domain/failures/failures.dart';

abstract class CameraRepository {
  Future<Either<Failure, CameraResult>> getFileFromCamera();
}
