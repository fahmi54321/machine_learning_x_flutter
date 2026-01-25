import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:linear_regression_flutter/0_data/datasources/salaries/salaries_datasources.dart';
import 'package:linear_regression_flutter/0_data/datasources/salaries/salaries_datasources_impl.dart';
import 'package:linear_regression_flutter/0_data/repositories/salaries/salaries_repositories_impl.dart';
import 'package:linear_regression_flutter/1_domain/repositories/salaries/salaries_repositories.dart';
import 'package:linear_regression_flutter/1_domain/usecases/salaries/salaries_usecase.dart';
import 'package:linear_regression_flutter/1_domain/usecases/salaries/validation/validation_salaries_usecase.dart';
import 'package:linear_regression_flutter/2_application/pages/salaries/cubit/predict_cubit.dart';

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
  // ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(
    () => PredictCubit(validationSalariesUsecase: sl(), salariesUseCase: sl()),
  );

  // ! domain Layer
  sl.registerFactory(() => ValidationSalariesUsecase());
  sl.registerFactory(() => SalariesUseCase(salariesRepositories: sl()));

  // ! data Layer
  sl.registerFactory<SalariesRepositories>(
    () => SalariesRepositoriesImpl(salariesDatasources: sl()),
  );
  sl.registerFactory<SalariesDatasources>(
    () => SalariesDatasourcesImpl(client: sl()),
  );

  // ! externs
  sl.registerFactory(() => http.Client());
}
