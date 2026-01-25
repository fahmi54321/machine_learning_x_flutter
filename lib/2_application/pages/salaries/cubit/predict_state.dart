// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'predict_cubit.dart';

enum PredictStatus { idle, loading, success, error }

class PredictState extends Equatable {
  final FormValue<String> yearsOfExperience;
  final SalariesEntity? salariesEntity;
  final PredictStatus predictStatus;
  final String? errorMessage;
  final Uint8List? visualizationImage;

  const PredictState({
    required this.yearsOfExperience,
    this.salariesEntity,
    required this.predictStatus,
    required this.errorMessage,
    this.visualizationImage,
  });

  @override
  List<Object?> get props {
    return [
      yearsOfExperience,
      salariesEntity,
      predictStatus,
      errorMessage,
      visualizationImage,
    ];
  }

  factory PredictState.initial() {
    return PredictState(
      yearsOfExperience: FormValue(
        value: '',
        validationStatus: ValidationStatus.pending,
      ),
      predictStatus: PredictStatus.idle,
      errorMessage: '',
    );
  }

  PredictState copyWith({
    FormValue<String>? yearsOfExperience,
    SalariesEntity? salariesEntity,
    PredictStatus? predictStatus,
    String? errorMessage,
    Uint8List? visualizationImage,
  }) {
    return PredictState(
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      salariesEntity: salariesEntity ?? this.salariesEntity,
      predictStatus: predictStatus ?? this.predictStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      visualizationImage: visualizationImage ?? this.visualizationImage,
    );
  }
}
