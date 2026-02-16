import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/provider/home_provider.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/widgets/bg_home.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/widgets/bottom_nav_home.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/widgets/main_home.dart';
import 'package:provider/provider.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(children: [BgHome(), MainHome()]),
      bottomNavigationBar: BottomNavHome(),
    );
  }
}
