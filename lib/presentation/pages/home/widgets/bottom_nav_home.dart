import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class BottomNavHome extends StatelessWidget {
  const BottomNavHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(icon: Icons.dashboard, label: "Dashboard", index: 0),
                _NavItem(
                  icon: Icons.health_and_safety,
                  label: "Insurance",
                  index: 1,
                ),
                _NavItem(icon: Icons.analytics, label: "Analytics", index: 2),
                _NavItem(icon: Icons.history, label: "History", index: 3),

                GestureDetector(
                  onTap: () {
                    _openMoreMenu(context: context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.grid_view, color: Colors.white),
                      SizedBox(height: 4),
                      Text(
                        "More",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openMoreMenu({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              height: 420,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                children: [
                  const Text(
                    "More Features",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      children: [
                        _GridItem(icon: Icons.description, label: "Reports"),
                        _GridItem(icon: Icons.psychology, label: "AI Lab"),
                        _GridItem(icon: Icons.settings, label: "Settings"),
                        _GridItem(
                          icon: Icons.notifications,
                          label: "Notifications",
                        ),
                        _GridItem(icon: Icons.receipt_long, label: "Logs"),
                        _GridItem(
                          icon: Icons.admin_panel_settings,
                          label: "Admin",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GridItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _GridItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withValues(alpha: 0.12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<HomeProvider>().state.currentIndex;

    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () {
        context.read<HomeProvider>().changeIndex(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isActive
              ? Colors.white.withValues(alpha: 0.15)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.white54),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isActive ? Colors.white : Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
