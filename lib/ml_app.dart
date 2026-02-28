import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_navigator.dart';
import 'package:machine_learning_x_flutter/presentation/core/listeners/global_ui_listener.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/home_page.dart';

class MlApp extends StatelessWidget {
  const MlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: appNavigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      builder: (context, child) {
        return GlobalUiListener(overlayService: sl(), child: child!);
      },
      home: HomeWrapper(),
    );
  }
}
