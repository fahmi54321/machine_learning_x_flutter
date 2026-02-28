import 'package:machine_learning_x_flutter/data/datasources/camera/camera_datasource.dart';
import 'package:machine_learning_x_flutter/data/datasources/camera/camera_datasource_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/camera/camera_repository_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/camera/camera_repository.dart';
import 'package:machine_learning_x_flutter/domain/usecases/camera/camera_usecase_impl.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/camera/camera_usecase.dart';

void initCameraFeature() {
  // USECASE
  sl.registerLazySingleton<CameraUsecase>(
    () => CameraUsecaseImpl(cameraRepository: sl()),
  );

  // REPO
  sl.registerLazySingleton<CameraRepository>(
    () => CameraRepositoryImpl(cameraDatasource: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<CameraDatasource>(
    () => CameraDatasourceImpl(imagePicker: sl()),
  );
}
