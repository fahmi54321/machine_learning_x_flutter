import 'package:machine_learning_x_flutter/data/datasources/startup/startup_datasource.dart';
import 'package:machine_learning_x_flutter/data/datasources/startup/startup_dataspurce_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/startup/startup_repositories_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/startup/startup_repository.dart';
import 'package:machine_learning_x_flutter/domain/usecases/converter/converter_usecase_impl.dart';
import 'package:machine_learning_x_flutter/domain/usecases/startup/startup_usecase_impl.dart';
import 'package:machine_learning_x_flutter/domain/usecases/validation/startup/validation_startup_usecase_impl.dart';
import 'package:machine_learning_x_flutter/application/pages/startup/provider/startup_provider.dart';
import 'package:machine_learning_x_flutter/application/usecases/converter/converter_usecase.dart';
import 'package:machine_learning_x_flutter/application/usecases/startup/startup_usecase.dart';
import 'package:machine_learning_x_flutter/application/usecases/validation/validation_startup_usecase.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';

void initStartupFeature() {
  // STATE
  sl.registerFactory(
    () => StartupProvider(
      validationStartupUsecase: sl(),
      startupUsecase: sl(),
      converterUsecase: sl(),
    ),
  );

  // USECASE
  sl.registerLazySingleton<ValidationStartupUsecase>(
    () => ValidationStartupUsecaseImpl(),
  );

  sl.registerLazySingleton<StartupUsecase>(
    () => StartupUsecaseImpl(startupRepository: sl()),
  );

  sl.registerLazySingleton<ConverterUsecase>(() => ConverterUsecaseImpl());

  // REPO
  sl.registerLazySingleton<StartupRepository>(
    () => StartupRepositoriesImpl(startupDatasource: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<StartupDatasource>(
    () => StartupDataspurceImpl(client: sl()),
  );
}
