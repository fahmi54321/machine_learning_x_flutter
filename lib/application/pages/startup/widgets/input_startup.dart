import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/application/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/application/pages/startup/provider/startup_provider.dart';
import 'package:provider/provider.dart';

class InputStartup extends StatelessWidget {
  const InputStartup({super.key});

  @override
  Widget build(BuildContext context) {
    final errorTextRd =
        context.watch<StartupProvider>().state.rdForm.validationStatus ==
            ValidationStatus.error
        ? 'Tidak boleh kosong'
        : null;
    final errorTextAdmin =
        context.watch<StartupProvider>().state.adminForm.validationStatus ==
            ValidationStatus.error
        ? 'Tidak boleh kosong'
        : null;
    final errorTextMarketing =
        context.watch<StartupProvider>().state.marketingForm.validationStatus ==
            ValidationStatus.error
        ? 'Tidak boleh kosong'
        : null;
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        _Input(
          onChanged: context.read<StartupProvider>().rdChanged,
          errorText: errorTextRd,
          hint: 'R&D Spend',
        ),
        _Input(
          onChanged: context.read<StartupProvider>().adminChanged,
          errorText: errorTextAdmin,
          hint: 'Administration',
        ),
        _Input(
          onChanged: context.read<StartupProvider>().marketingChanged,
          errorText: errorTextMarketing,
          hint: 'Marketing Spend',
        ),
        _Dropdown(
          initialValue: context.watch<StartupProvider>().state.selectedState,
          onChanged: context.read<StartupProvider>().updateSelectedState,
        ),
      ],
    );
  }
}

class _Input extends StatelessWidget {
  final Function(String)? onChanged;
  final String hint;
  final String? errorText;

  const _Input({
    required this.hint,
    required this.onChanged,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: TextFormField(
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
          errorText: errorText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class _Dropdown extends StatelessWidget {
  final String initialValue;
  final Function(String? val)? onChanged;
  const _Dropdown({required this.initialValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: DropdownButtonFormField<String>(
        initialValue: initialValue,
        dropdownColor: const Color(0xff203a43),
        items: const [
          DropdownMenuItem(value: 'California', child: Text('California')),
          DropdownMenuItem(value: 'New York', child: Text('New York')),
          DropdownMenuItem(value: 'Florida', child: Text('Florida')),
        ],
        onChanged: onChanged,
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
}
