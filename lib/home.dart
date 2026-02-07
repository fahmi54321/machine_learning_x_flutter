import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class StartupPredictionState extends ChangeNotifier {
  final rdController = TextEditingController();
  final adminController = TextEditingController();
  final marketingController = TextEditingController();

  String selectedState = 'California';

  bool isLoading = false;
  bool isPressed = false;

  double profit = 0;
  String classification = '';
  String description = '';
  List<String> recommendations = [];

  void setPressed(bool value) {
    isPressed = value;
    notifyListeners();
  }

  Future<void> predict() async {
    final rd = double.tryParse(rdController.text);
    final admin = double.tryParse(adminController.text);
    final marketing = double.tryParse(marketingController.text);

    if (rd == null || admin == null || marketing == null) return;

    isLoading = true;
    notifyListeners();

    try {
      final res = await http.post(
        Uri.parse('http://10.0.2.2:5000/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "rd_spend": rd,
          "administration": admin,
          "marketing_spend": marketing,
          "state": selectedState,
        }),
      );

      final json = jsonDecode(res.body);

      profit = json['predicted_profit'];
      classification = json['classification'];
      description = json['description'];
      recommendations = List<String>.from(json['recommendation']);
    } catch (e) {
      classification = 'Error';
      description = 'Unable to connect to prediction service.';
    }

    isLoading = false;
    notifyListeners();
  }
}

class StartupPredictionWebPage extends StatelessWidget {
  const StartupPredictionWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StartupPredictionState(),
      child: Consumer<StartupPredictionState>(
        builder: (context, state, _) {
          return Scaffold(
            body: Stack(
              children: [
                /// BACKGROUND
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff0f2027),
                        Color(0xff203a43),
                        Color(0xff2c5364),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),

                /// CONTENT
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          width: 820,
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: Colors.white30),
                          ),
                          child: Column(
                            children: [
                              /// TITLE
                              Text(
                                'Startup Profit Prediction',
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Multiple Linear Regression • Business Insight System',
                                style: TextStyle(color: Colors.white70),
                              ),

                              const SizedBox(height: 28),

                              /// INPUTS
                              Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                alignment: WrapAlignment.center,
                                children: [
                                  _input(state.rdController, 'R&D Spend'),
                                  _input(
                                    state.adminController,
                                    'Administration',
                                  ),
                                  _input(
                                    state.marketingController,
                                    'Marketing Spend',
                                  ),
                                  _dropdown(state),
                                ],
                              ),

                              const SizedBox(height: 24),

                              /// BUTTON
                              GestureDetector(
                                onTapDown: (_) => state.setPressed(true),
                                onTapUp: (_) => state.setPressed(false),
                                onTapCancel: () => state.setPressed(false),
                                onTap: state.predict,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 36,
                                    vertical: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: state.isPressed
                                        ? Colors.white.withValues(alpha: 0.18)
                                        : Colors.white.withValues(alpha: 0.28),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Text(
                                    'Predict Profit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),

                              state.isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : state.profit > 0
                                  ? _result(state)
                                  : const SizedBox.shrink(),
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
      width: 220,
      child: TextField(
        controller: c,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _dropdown(StartupPredictionState state) {
    return SizedBox(
      width: 220,
      child: DropdownButtonFormField<String>(
        value: state.selectedState,
        dropdownColor: const Color(0xff203a43),
        items: const [
          DropdownMenuItem(value: 'California', child: Text('California')),
          DropdownMenuItem(value: 'New York', child: Text('New York')),
          DropdownMenuItem(value: 'Florida', child: Text('Florida')),
        ],
        onChanged: (v) {
          state.selectedState = v!;
          state.notifyListeners();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _result(StartupPredictionState state) {
    return Column(
      key: ValueKey(state.profit),
      children: [
        Text(
          '\$${state.profit.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          state.classification,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          state.description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 16),
        ...state.recommendations.map(
          (e) => Text('• $e', style: const TextStyle(color: Colors.white70)),
        ),
      ],
    );
  }
}
