import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_theme.dart';

void initCore() {
  sl.registerLazySingleton<AppState>(() => AppState());
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
}
