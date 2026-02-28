import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';

class GlassPrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const GlassPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<GlassPrimaryButton> createState() => _GlassPrimaryButtonState();
}

class _GlassPrimaryButtonState extends State<GlassPrimaryButton> {
  bool isPressed = false;

  void setPressed(bool value) {
    setState(() => isPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (_) => setPressed(true),
      onTapUp: (_) => setPressed(false),
      onTapCancel: () => setPressed(false),
      onTap: widget.onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: isPressed ? 0.96 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
          decoration: BoxDecoration(
            gradient: glass.primaryGradient,
            borderRadius: BorderRadius.circular(glass.radius),
          ),
          child: Text(
            widget.text,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
