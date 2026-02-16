// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:machine_learning_x_flutter/domain/entities/insurance/insurance_entity.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';

enum InsuranceStatus { idle, loading, success, error }

class InsuranceState extends Equatable {
  final FormValue<String> age;
  final FormValue<String> bmi;
  final FormValue<String> children;
  final InsuranceEntity insuranceEntity;
  final String errorMessage;

  final String selectedSex;
  final String selectedSmoker;
  final String selectedRegion;
  final InsuranceStatus status;

  const InsuranceState({
    required this.age,
    required this.bmi,
    required this.children,
    required this.insuranceEntity,
    required this.errorMessage,
    required this.selectedSex,
    required this.selectedSmoker,
    required this.selectedRegion,
    required this.status,
  });

  factory InsuranceState.initial() {
    return InsuranceState(
      age: FormValue(value: '', validationStatus: ValidationStatus.idle),
      bmi: FormValue(value: '', validationStatus: ValidationStatus.idle),
      children: FormValue(value: '', validationStatus: ValidationStatus.idle),
      insuranceEntity: InsuranceEntity(
        description: '',
        predictedCharges: 0.0,
        riskCategory: '',
      ),
      selectedSex: 'male',
      selectedSmoker: 'no',
      selectedRegion: 'southeast',

      status: InsuranceStatus.idle,
      errorMessage: '',
    );
  }

  InsuranceState copyWith({
    FormValue<String>? age,
    FormValue<String>? bmi,
    FormValue<String>? children,
    InsuranceEntity? insuranceEntity,
    String? errorMessage,
    String? selectedSex,
    String? selectedSmoker,
    String? selectedRegion,
    InsuranceStatus? status,
    double? predictedCharges,
    String? riskCategory,
    String? description,
  }) {
    return InsuranceState(
      age: age ?? this.age,
      bmi: bmi ?? this.bmi,
      children: children ?? this.children,
      insuranceEntity: insuranceEntity ?? this.insuranceEntity,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedSex: selectedSex ?? this.selectedSex,
      selectedSmoker: selectedSmoker ?? this.selectedSmoker,
      selectedRegion: selectedRegion ?? this.selectedRegion,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      age,
      bmi,
      children,
      insuranceEntity,
      errorMessage,
      selectedSex,
      selectedSmoker,
      selectedRegion,
      status,
    ];
  }
}
