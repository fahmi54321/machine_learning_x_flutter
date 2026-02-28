import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/domain/entities/file/file_result.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/file/file_repository.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/file/file_usecase.dart';

class FileUsecaseImpl implements FileUsecase {
  final FileRepository fileRepository;
  FileUsecaseImpl({required this.fileRepository});
  @override
  Future<Either<Failure, FileResult>> getFileFromGallery() {
    return fileRepository.getFileFromGallery();
  }
}
