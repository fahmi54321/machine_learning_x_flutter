import 'package:machine_learning_x_flutter/data/datasources/insurance/insurance_datasource.dart';
import 'package:machine_learning_x_flutter/data/datasources/insurance/insurance_datasource_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/insurance/insurance_repository_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/insurance/insurance_repository.dart';
import 'package:machine_learning_x_flutter/domain/usecases/insurance/insurance_usecase_impl.dart';
import 'package:machine_learning_x_flutter/domain/usecases/insurance/validation/insurance_validation_usecase_impl.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/provider/insurance_provider.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/insurance/insurance_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/insurance/validation/insurance_validation_usecase.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';

void initInsuranceFeature() {
  // STATE
  sl.registerFactory(
    () => InsuranceProvider(
      insuranceValidationUsecase: sl(),
      insuranceUsecase: sl(),
      converterUsecase: sl(),
      appState: sl(),
    ),
  );

  // USECASE
  sl.registerLazySingleton<InsuranceValidationUsecase>(
    () => InsuranceValidationUsecaseImpl(),
  );

  sl.registerLazySingleton<InsuranceUsecase>(
    () => InsuranceUsecaseImpl(insuranceRepository: sl()),
  );

  // REPO
  sl.registerLazySingleton<InsuranceRepository>(
    () => InsuranceRepositoryImpl(insuranceDatasource: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<InsuranceDatasource>(
    () => InsuranceDatasourceImpl(client: sl()),
  );
}
