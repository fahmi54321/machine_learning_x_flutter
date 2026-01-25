import 'package:flutter/material.dart';
import 'package:linear_regression_flutter/2_application/pages/salaries/salaries_page.dart';
import 'injection.dart' as di; // di = dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: SalariesPageWrapper(),
    );
  }
}
