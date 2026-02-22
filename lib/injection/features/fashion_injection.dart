import 'package:machine_learning_x_flutter/data/datasources/fashion/fashion_datasource.dart';
import 'package:machine_learning_x_flutter/data/datasources/fashion/fashion_datasource_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/fashion/fashion_respository_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/fashion/fashion_repository.dart';
import 'package:machine_learning_x_flutter/domain/usecases/fashion/fashion_usecase_impl.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/provider/fashion_predictor_provider.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/fashion/fashion_usecase.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';

void initFashionFeature() {
  // STATE
  sl.registerFactory(
    () =>
        FashionPredictorProvider(fashionUsecase: sl(), converterUsecase: sl()),
  );

  // USECASE
  sl.registerLazySingleton<FashionUsecase>(
    () => FashionUsecaseImpl(fashionRepository: sl()),
  );

  // REPO
  sl.registerLazySingleton<FashionRepository>(
    () => FashionRespositoryImpl(fashionDatasource: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<FashionDatasource>(
    () => FashionDatasourceImpl(client: sl()),
  );
}
