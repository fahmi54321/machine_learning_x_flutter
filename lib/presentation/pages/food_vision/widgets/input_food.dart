import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/provider/food_vision_provider.dart';
import 'package:provider/provider.dart';

class InputFood extends StatelessWidget {
  const InputFood({super.key});

  void _openImageSourceMenu(BuildContext context) {
    final theme = Theme.of(context);
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
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
              height: 300,
              padding: const EdgeInsets.fromLTRB(30, 16, 30, 30),
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
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: glass.white38Color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Select Image Source",
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 20.0),
                  ),

                  const SizedBox(height: 35),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ImageSourceItem(
                        icon: Icons.photo_library_rounded,
                        label: "Gallery",
                        onTap: () {
                          Navigator.pop(context);
                          context
                              .read<FoodVisionProvider>()
                              .pickImageFromGallery();
                        },
                      ),
                      _ImageSourceItem(
                        icon: Icons.camera_alt_rounded,
                        label: "Camera",
                        onTap: () {
                          Navigator.pop(context);
                          context
                              .read<FoodVisionProvider>()
                              .pickImageFromCamera();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedImage = context
        .watch<FoodVisionProvider>()
        .state
        .selectedImage;

    final errorText =
        context
                .watch<FoodVisionProvider>()
                .state
                .trueLabelValue
                .validationStatus ==
            ValidationStatus.error
        ? "True Label tidak boleh kosong"
        : null;
    final theme = Theme.of(context);
    final glass = Theme.of(context).extension<AppGlassTheme>()!;

    return Column(
      children: [
        GestureDetector(
          onTap: () => _openImageSourceMenu(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: theme.colorScheme.outline),
              color: theme.colorScheme.surface.withValues(
                alpha: glass.backgroundAlpha,
              ),
            ),
            child: selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(selectedImage, fit: BoxFit.cover),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_rounded, size: 40.0),
                      SizedBox(height: 10),
                      Text(
                        "Upload Image",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
          ),
        ),

        const SizedBox(height: 20),

        TextFormField(
          decoration: InputDecoration(
            hintText: "Masukkan True Label",
            errorText: errorText,
          ),

          onChanged: (value) {
            context.read<FoodVisionProvider>().setTrueLabel(value);
          },
        ),
      ],
    );
  }
}

class _ImageSourceItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ImageSourceItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ImageSourceItem> createState() => _ImageSourceItemState();
}

class _ImageSourceItemState extends State<_ImageSourceItem>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  late final AnimationController _controller;
  late final Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bounceAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.15,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.15,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.elasticOut)),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  void _handleTap() {
    _controller.forward(from: 0);
    widget.onTap();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _bounceAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _bounceAnimation.value, child: child);
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: glass.bgImageGradient,
                boxShadow: [
                  if (_isPressed)
                    BoxShadow(
                      color: glass.bgImageColor.withValues(
                        alpha: glass.imageAlpha,
                      ),
                      blurRadius: 25,
                      spreadRadius: 4,
                    ),
                ],
              ),
              child: Icon(
                widget.icon,
                color: theme.colorScheme.surface,
                size: 30,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.label,

              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
