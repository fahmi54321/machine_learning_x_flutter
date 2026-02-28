import 'package:machine_learning_x_flutter/data/datasources/startup/startup_datasource.dart';
import 'package:machine_learning_x_flutter/data/datasources/startup/startup_dataspurce_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/startup/startup_repositories_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/startup/startup_repository.dart';
import 'package:machine_learning_x_flutter/domain/usecases/startup/startup_usecase_impl.dart';
import 'package:machine_learning_x_flutter/domain/usecases/startup/startup/validation_startup_usecase_impl.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/provider/startup_provider.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/startup/startup_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/startup/validation/validation_startup_usecase.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';

void initStartupFeature() {
  // STATE
  sl.registerFactory(
    () => StartupProvider(
      validationStartupUsecase: sl(),
      startupUsecase: sl(),
      converterUsecase: sl(),
      appState: sl(),
    ),
  );

  // USECASE
  sl.registerLazySingleton<ValidationStartupUsecase>(
    () => ValidationStartupUsecaseImpl(),
  );

  sl.registerLazySingleton<StartupUsecase>(
    () => StartupUsecaseImpl(startupRepository: sl()),
  );

  // REPO
  sl.registerLazySingleton<StartupRepository>(
    () => StartupRepositoriesImpl(startupDatasource: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<StartupDatasource>(
    () => StartupDataspurceImpl(client: sl()),
  );
}
