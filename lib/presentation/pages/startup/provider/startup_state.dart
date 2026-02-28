import 'package:equatable/equatable.dart';

import 'package:machine_learning_x_flutter/domain/entities/startup/startup_entity.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';

enum StartupStatus { loading, error, success, idle }

class StartupState extends Equatable {
  final StartupStatus status;
  final FormValue<String> rdForm;
  final FormValue<String> adminForm;
  final FormValue<String> marketingForm;
  final String selectedState;
  final StartupEntity? startupEntity;

  const StartupState({
    required this.status,
    required this.rdForm,
    required this.adminForm,
    required this.marketingForm,
    required this.selectedState,
    this.startupEntity,
  });

  factory StartupState.initial() {
    return StartupState(
      status: StartupStatus.idle,

      rdForm: FormValue(value: '', validationStatus: ValidationStatus.initial),
      marketingForm: FormValue(
        value: '',
        validationStatus: ValidationStatus.initial,
      ),
      adminForm: FormValue(
        value: '',
        validationStatus: ValidationStatus.initial,
      ),
      selectedState: 'California',
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      rdForm,
      adminForm,
      marketingForm,
      selectedState,
      startupEntity,
    ];
  }

  StartupState copyWith({
    StartupStatus? status,
    double? profit,
    String? classification,
    String? description,
    List<String>? recommendations,
    FormValue<String>? rdForm,
    FormValue<String>? adminForm,
    FormValue<String>? marketingForm,
    String? selectedState,
    StartupEntity? startupEntity,
  }) {
    return StartupState(
      status: status ?? this.status,
      rdForm: rdForm ?? this.rdForm,
      adminForm: adminForm ?? this.adminForm,
      marketingForm: marketingForm ?? this.marketingForm,
      selectedState: selectedState ?? this.selectedState,
      startupEntity: startupEntity ?? this.startupEntity,
    );
  }

  @override
  bool get stringify => true;
}
