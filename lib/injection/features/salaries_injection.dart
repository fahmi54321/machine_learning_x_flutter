import 'package:machine_learning_x_flutter/data/datasources/salaries/salaries_datasources.dart';
import 'package:machine_learning_x_flutter/data/datasources/salaries/salaries_datasources_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/salaries/salaries_repositories_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/salaries/salaries_repositories.dart';
import 'package:machine_learning_x_flutter/domain/usecases/salaries/salaries_usecase_impl.dart';
import 'package:machine_learning_x_flutter/domain/usecases/salaries/validation/validation_salaries_usecase_impl.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/cubit/predict_cubit.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/salaries_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/salaries/validation/validation_salaries_usecase.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';

void initSalariesFeature() {
  // STATE
  sl.registerFactory(
    () => PredictCubit(validationSalariesUsecase: sl(), salariesUseCase: sl()),
  );

  // USECASE
  sl.registerLazySingleton<ValidationSalariesUsecase>(
    () => ValidationSalariesUsecaseImpl(),
  );

  sl.registerLazySingleton<SalariesUseCase>(
    () => SalariesUseCaseImpl(salariesRepositories: sl()),
  );

  // REPO
  sl.registerLazySingleton<SalariesRepositories>(
    () => SalariesRepositoriesImpl(salariesDatasources: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<SalariesDatasources>(
    () => SalariesDatasourcesImpl(client: sl()),
  );
}
