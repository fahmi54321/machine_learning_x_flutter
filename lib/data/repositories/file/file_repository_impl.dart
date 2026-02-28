import 'package:dartz/dartz.dart';
import 'package:machine_learning_x_flutter/data/datasources/file/file_datasource.dart';
import 'package:machine_learning_x_flutter/data/exceptions/exceptions.dart';
import 'package:machine_learning_x_flutter/domain/entities/file/file_result.dart';
import 'package:machine_learning_x_flutter/domain/failures/failures.dart';
import 'package:machine_learning_x_flutter/domain/repositories/file/file_repository.dart';

class FileRepositoryImpl implements FileRepository {
  final FileDatasource fileDatasource;

  FileRepositoryImpl({required this.fileDatasource});

  @override
  Future<Either<Failure, FileResult>> getFileFromGallery() async {
    try {
      final result = await fileDatasource.getFileFromGallery();

      if (result == null) {
        return right(FileCanceled());
      }

      return right(FileSuccess(result));
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
