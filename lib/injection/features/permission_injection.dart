import 'package:machine_learning_x_flutter/data/datasources/permission/permission_datasource.dart';
import 'package:machine_learning_x_flutter/data/datasources/permission/permission_datasource_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/permission/permission_repository_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/permission/permision_repository.dart';
import 'package:machine_learning_x_flutter/domain/usecases/permission/permission_usecase_impl.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/permission/permission_usecase.dart';

void initPermissionFeature() {
  // USECASE
  sl.registerLazySingleton<PermissionUsecase>(
    () => PermissionUsecaseImpl(permissionRepository: sl()),
  );

  // REPO
  sl.registerLazySingleton<PermissionRepository>(
    () => PermissionRepositoryImpl(permissionDatasource: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<PermissionDatasource>(
    () => PermissionDatasourceImpl(deviceInfoPlugin: sl()),
  );
}
