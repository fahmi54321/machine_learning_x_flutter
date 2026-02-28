import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/file/file_result.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';

abstract class FileUsecase {
  Future<Either<Failure, FileResult>> getFileFromGallery();
}
