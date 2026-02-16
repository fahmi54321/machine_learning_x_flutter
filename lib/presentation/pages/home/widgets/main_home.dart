import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<HomeProvider>().state.currentIndex;
    final pages = context.watch<HomeProvider>().state.pages;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: currentIndex < 4 ? pages[currentIndex] : const SizedBox(),
    );
  }
}
