import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/provider/insurance_provider.dart';

class InputsInsurance extends StatelessWidget {
  const InputsInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    final errorTextAge =
        context.watch<InsuranceProvider>().state.age.validationStatus ==
            ValidationStatus.error
        ? 'Tidak boleh kosong'
        : null;
    debugPrint('errorTextAge: $errorTextAge');
    final errorTextBmi =
        context.watch<InsuranceProvider>().state.bmi.validationStatus ==
            ValidationStatus.error
        ? 'Tidak boleh kosong'
        : null;
    final errorTextChildren =
        context.watch<InsuranceProvider>().state.children.validationStatus ==
            ValidationStatus.error
        ? 'Tidak boleh kosong'
        : null;
    final selectedSex = context.watch<InsuranceProvider>().state.selectedSex;
    final selectedSmoker = context
        .watch<InsuranceProvider>()
        .state
        .selectedSmoker;
    final selectedRegion = context
        .watch<InsuranceProvider>()
        .state
        .selectedRegion;
    return Wrap(
      spacing: 18,
      runSpacing: 18,
      children: [
        _Input(
          onChanged: context.read<InsuranceProvider>().updateAge,
          hint: 'Age',
          errorText: errorTextAge,
        ),
        _Input(
          onChanged: context.read<InsuranceProvider>().updateBmi,
          hint: 'BMI',
          errorText: errorTextBmi,
        ),
        _Input(
          onChanged: context.read<InsuranceProvider>().updateChildren,
          hint: 'Children',
          errorText: errorTextChildren,
        ),
        _Dropdown(
          value: selectedSex,
          items: const ['male', 'female'],
          onChanged: (v) {
            context.read<InsuranceProvider>().updateSelectedSex(v);
          },
        ),
        _Dropdown(
          value: selectedSmoker,
          items: const ['yes', 'no'],
          onChanged: (v) {
            context.read<InsuranceProvider>().updateSelectedSmoker(v);
          },
        ),
        _Dropdown(
          value: selectedRegion,
          items: const ['southeast', 'southwest', 'northeast', 'northwest'],
          onChanged: (v) {
            context.read<InsuranceProvider>().updateSelectedRegion(v);
          },
        ),
      ],
    );
  }
}

class _Dropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;
  const _Dropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownButtonFormField<String>(
        initialValue: value,
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
}

class _Input extends StatelessWidget {
  final Function(String)? onChanged;
  final String hint;
  final String? errorText;
  const _Input({required this.onChanged, required this.hint, this.errorText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        onChanged: onChanged,

        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          errorText: errorText,
        ),
      ),
    );
  }
}
