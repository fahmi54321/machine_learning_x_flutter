import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:http/http.dart' as http;

Future<void> initExternal() async {
  sl.registerLazySingleton(() => http.Client());

  await sl.allReady();
}
