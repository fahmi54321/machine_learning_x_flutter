import 'package:machine_learning_x_flutter/data/datasources/food/food_datasource.dart';
import 'package:machine_learning_x_flutter/data/datasources/food/food_datasource_impl.dart';
import 'package:machine_learning_x_flutter/data/repositories/food/food_respository_impl.dart';
import 'package:machine_learning_x_flutter/domain/repositories/food/food_repository.dart';
import 'package:machine_learning_x_flutter/domain/usecases/food/food_usecase_impl.dart';
import 'package:machine_learning_x_flutter/domain/usecases/food/validation/validation_food_usecase_impl.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/provider/food_vision_provider.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/food/food_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/food/validation/validation_food_usecase.dart';

void initFoodFeature() {
  // STATE
  sl.registerFactory(
    () => FoodVisionProvider(
      foodUsecase: sl(),
      converterUsecase: sl(),
      fileUsecase: sl(),
      cameraUsecase: sl(),
      validationFoodUsecase: sl(),
      permissionUsecase: sl(),
      appState: sl(),
    ),
  );

  // USECASE
  sl.registerLazySingleton<FoodUsecase>(
    () => FoodUsecaseImpl(foodRepository: sl()),
  );

  sl.registerLazySingleton<ValidationFoodUsecase>(
    () => ValidationFoodUsecaseImpl(),
  );

  // REPO
  sl.registerLazySingleton<FoodRepository>(
    () => FoodRespositoryImpl(foodDatasource: sl()),
  );

  // DATASOURCE
  sl.registerLazySingleton<FoodDatasource>(
    () => FoodDatasourceImpl(client: sl()),
  );
}
