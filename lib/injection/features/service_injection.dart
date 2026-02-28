import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/core/services/app_overlay_service.dart';

void initServiceFeature() {
  sl.registerLazySingleton(() => AppOverlayService());
}
