import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/ml_app.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:provider/provider.dart';
import 'injection/injection.dart' as di; // di = dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => sl<AppState>())],
      child: MlApp(appTheme: sl()),
    );
  }
}
