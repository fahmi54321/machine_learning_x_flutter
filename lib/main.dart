import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/home_page.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomeWrapper(),
    );
  }
}
