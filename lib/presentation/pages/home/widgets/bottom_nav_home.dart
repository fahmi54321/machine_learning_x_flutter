// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/food_vision_page.dart';
import 'package:provider/provider.dart';

import 'package:machine_learning_x_flutter/presentation/pages/home/provider/home_provider.dart';

class BottomNavHome extends StatelessWidget {
  const BottomNavHome({super.key});

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: glass.sigmaX, sigmaY: glass.sigmaY),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withValues(
                alpha: glass.backgroundAlpha,
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: theme.colorScheme.outline),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.health_and_safety,
                  label: "Insurance",
                  index: 0,
                ),
                _NavItem(icon: Icons.money, label: "Salary", index: 1),
                _NavItem(icon: Icons.analytics, label: "Startup", index: 2),
                _NavItem(icon: Icons.shop_rounded, label: "Fashion", index: 3),

                GestureDetector(
                  onTap: () {
                    _openMoreMenu(context: context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.grid_view, color: theme.colorScheme.surface),
                      SizedBox(height: 4),
                      Text(
                        "More",
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.surface,
                        ),
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
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: glass.transparentColor,
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
                color: theme.colorScheme.surface.withValues(
                  alpha: glass.backgroundAlpha,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                border: Border.all(color: theme.colorScheme.outline),
              ),
              child: Column(
                children: [
                  Text(
                    "More Features",
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 22.0),
                  ),

                  const SizedBox(height: 25),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      children: [
                        _GridItem(
                          icon: Icons.food_bank,
                          label: "Food Vision",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FoodVisionWrapper(),
                              ),
                            );
                          },
                        ),
                        _GridItem(
                          icon: Icons.psychology,
                          label: "AI Lab",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        _GridItem(
                          icon: Icons.settings,
                          label: "Settings",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        _GridItem(
                          icon: Icons.notifications,
                          label: "Notifications",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        _GridItem(
                          icon: Icons.receipt_long,
                          label: "Logs",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        _GridItem(
                          icon: Icons.admin_panel_settings,
                          label: "Admin",
                          onTap: () {
                            Navigator.pop(context);
                          },
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
  final Function()? onTap;
  final String label;
  const _GridItem({
    required this.icon,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.surface.withValues(
            alpha: glass.backgroundAlpha,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 10),
            Text(label, style: theme.textTheme.bodySmall),
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
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);

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
              ? theme.colorScheme.surface.withValues(alpha: glass.borderAlpha)
              : glass.transparentColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive
                  ? theme.colorScheme.onSurface
                  : glass.white54Color,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 11.0,
                color: glass.white54Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
