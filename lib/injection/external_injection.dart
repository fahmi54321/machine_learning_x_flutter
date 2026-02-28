import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:machine_learning_x_flutter/core/auth/auth_event_bus.dart';
import 'package:machine_learning_x_flutter/data/network/dio_client.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';

Future<void> initExternal() async {
  sl.registerLazySingleton(() => AuthEventBus());
  sl.registerLazySingleton(() => DioClient(authEventBus: sl()));
  sl.registerLazySingleton(() => DeviceInfoPlugin());
  sl.registerLazySingleton(() => ImagePicker());

  await sl.allReady();
}
