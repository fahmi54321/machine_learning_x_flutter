import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ExampleState extends ChangeNotifier {
  final ageController = TextEditingController();
  final bmiController = TextEditingController();
  final childrenController = TextEditingController();

  String selectedSex = 'male';
  String selectedSmoker = 'no';
  String selectedRegion = 'southeast';

  bool isLoading = false;
  bool isPressed = false;

  double predictedCharges = 0;
  String riskCategory = '';
  String description = '';

  void setPressed(bool v) {
    isPressed = v;
    notifyListeners();
  }

  Future<void> predict() async {
    final age = double.tryParse(ageController.text);
    final bmi = double.tryParse(bmiController.text);
    final children = double.tryParse(childrenController.text);

    if (age == null || bmi == null || children == null) return;

    isLoading = true;
    notifyListeners();

    try {
      final res = await http.post(
        Uri.parse('http://10.0.2.2:5000/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "age": age,
          "sex": selectedSex,
          "bmi": bmi,
          "children": children,
          "smoker": selectedSmoker,
          "region": selectedRegion,
        }),
      );

      final json = jsonDecode(res.body);

      predictedCharges = json['predicted_charges'];
      riskCategory = json['risk_category'];
      description = json['description'];
    } catch (e) {
      riskCategory = 'Error';
      description = 'Unable to connect to API service';
    }

    isLoading = false;
    notifyListeners();
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExampleState(),
      child: Consumer<ExampleState>(
        builder: (context, state, _) {
          return Scaffold(
            body: Stack(
              children: [
                /// Animated Gradient Background
                AnimatedContainer(
                  duration: const Duration(seconds: 5),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff141E30), Color(0xff243B55)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),

                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Container(
                          width: 850,
                          padding: const EdgeInsets.all(36),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Column(
                            children: [
                              /// TITLE
                              const Text(
                                'Insurance Cost Prediction',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 30),

                              /// INPUTS
                              Wrap(
                                spacing: 18,
                                runSpacing: 18,
                                children: [
                                  _input(state.ageController, 'Age'),
                                  _input(state.bmiController, 'BMI'),
                                  _input(state.childrenController, 'Children'),
                                  _dropdown(
                                    value: state.selectedSex,
                                    items: const ['male', 'female'],
                                    onChanged: (v) {
                                      state.selectedSex = v!;
                                      state.notifyListeners();
                                    },
                                  ),
                                  _dropdown(
                                    value: state.selectedSmoker,
                                    items: const ['yes', 'no'],
                                    onChanged: (v) {
                                      state.selectedSmoker = v!;
                                      state.notifyListeners();
                                    },
                                  ),
                                  _dropdown(
                                    value: state.selectedRegion,
                                    items: const [
                                      'southeast',
                                      'southwest',
                                      'northeast',
                                      'northwest',
                                    ],
                                    onChanged: (v) {
                                      state.selectedRegion = v!;
                                      state.notifyListeners();
                                    },
                                  ),
                                ],
                              ),

                              const SizedBox(height: 28),

                              /// BUTTON WITH SCALE ANIMATION
                              GestureDetector(
                                onTapDown: (_) => state.setPressed(true),
                                onTapUp: (_) => state.setPressed(false),
                                onTapCancel: () => state.setPressed(false),
                                onTap: state.predict,
                                child: AnimatedScale(
                                  duration: const Duration(milliseconds: 150),
                                  scale: state.isPressed ? 0.95 : 1,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 36,
                                      vertical: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xff00c6ff),
                                          Color(0xff0072ff),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: const Text(
                                      'Predict Insurance Cost',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),

                              /// RESULT WITH ANIMATED SWITCHER
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (child, animation) =>
                                    FadeTransition(
                                      opacity: animation,
                                      child: SlideTransition(
                                        position: Tween(
                                          begin: const Offset(0, 0.2),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      ),
                                    ),
                                child: state.isLoading
                                    ? const CircularProgressIndicator(
                                        key: ValueKey('loading'),
                                        color: Colors.white,
                                      )
                                    : state.predictedCharges > 0
                                    ? _result(state)
                                    : const SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _input(TextEditingController c, String hint) {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: c,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _dropdown({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return SizedBox(
      width: 200,
      child: DropdownButtonFormField<String>(
        value: value,
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        dropdownColor: const Color(0xff243B55),
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _result(ExampleState state) {
    final riskColor = state.riskCategory == "Low Cost"
        ? Colors.greenAccent
        : state.riskCategory == "Medium Cost"
        ? Colors.orangeAccent
        : Colors.redAccent;

    return Column(
      key: ValueKey(state.predictedCharges),
      children: [
        Text(
          '\$${state.predictedCharges.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          state.riskCategory,
          style: TextStyle(
            color: riskColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          state.description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
