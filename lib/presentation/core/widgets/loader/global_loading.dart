import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/container/glass_container.dart';

class GlobalLoadingWidget extends StatelessWidget {
  const GlobalLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassContainer(
      glowColor: Colors.blueAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: Colors.white),
          SizedBox(height: 20),
          Text("Sedang Memproses...", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
