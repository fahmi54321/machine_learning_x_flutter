import 'package:machine_learning_x_flutter/data/datasources/file/file_datasource.dart';
import 'package:machine_learning_x_flutter/data/datasources/file/file_datasource_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/file/file_repository_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/file/file_repository.dart';
import 'package:machine_learning_x_flutter/domain/usecases/file/file_usecase_impl.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/file/file_usecase.dart';

void initFileFeature() {
  // USECASE
  sl.registerLazySingleton<FileUsecase>(
    () => FileUsecaseImpl(fileRepository: sl()),
  );

  // REPO
  sl.registerLazySingleton<FileRepository>(
    () => FileRepositoryImpl(fileDatasource: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<FileDatasource>(
    () => FileDatasourceImpl(imagePicker: sl()),
  );
}
