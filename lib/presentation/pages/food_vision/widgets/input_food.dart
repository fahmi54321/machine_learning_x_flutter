import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/provider/food_vision_provider.dart';
import 'package:provider/provider.dart';

class InputFood extends StatelessWidget {
  const InputFood({super.key});

  void _openImageSourceMenu(BuildContext context) {
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
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Select Image Source",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
              border: Border.all(color: Colors.white24),
              color: Colors.white.withValues(alpha: 0.05),
            ),
            child: selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(selectedImage, fit: BoxFit.cover),
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_rounded,
                        size: 40,
                        color: Colors.white70,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Upload Image",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
          ),
        ),

        const SizedBox(height: 20),

        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Masukkan True Label",
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.06),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
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
                gradient: const LinearGradient(
                  colors: [Color(0xff00c6ff), Color(0xff0072ff)],
                ),
                boxShadow: [
                  if (_isPressed)
                    BoxShadow(
                      color: const Color(0xff00c6ff).withValues(alpha: 0.6),
                      blurRadius: 25,
                      spreadRadius: 4,
                    ),
                ],
              ),
              child: Icon(widget.icon, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 12),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
