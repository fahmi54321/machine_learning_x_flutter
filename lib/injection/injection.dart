import 'package:get_it/get_it.dart';
import 'package:machine_learning_x_flutter/injection/core_injection.dart';
import 'package:machine_learning_x_flutter/injection/external_injection.dart';
import 'package:machine_learning_x_flutter/injection/features/converter_injection.dart';
import 'package:machine_learning_x_flutter/injection/features/fashion_injection.dart';
import 'package:machine_learning_x_flutter/injection/features/insurance_injection.dart';
import 'package:machine_learning_x_flutter/injection/features/salaries_injection.dart';
import 'package:machine_learning_x_flutter/injection/features/startup_injection.dart';

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
  await initExternal();
  initCore();
  initConverterFeature();
  initSalariesFeature();
  initStartupFeature();
  initInsuranceFeature();
  initFashionFeature();
}

// Note:
// ----------

/*
--registerFactory--
Gunakan untuk:
1. PageState
2. Cubit
3. Provider
4. State management lainnya*/

/*
--registerLazySingleton--
Gunakan untuk:
1. Repository
2. Usecase
3. Datasource
3. Dio
4. EventBus*/

/*
--registerSingletonAsync--
Gunakan untuk:
1. SharedPreferences
2. Database
3. SecureStorage
3. SQL
4. Dan local lainnya*/
