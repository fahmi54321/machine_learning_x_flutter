// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'predict_cubit.dart';

enum PredictStatus { idle, loading, success, error }

class PredictState extends Equatable {
  final FormValue<String> yearsOfExperience;
  final SalariesEntity? salariesEntity;
  final PredictStatus predictStatus;
  final Uint8List? visualizationImage;

  const PredictState({
    required this.yearsOfExperience,
    this.salariesEntity,
    required this.predictStatus,
    this.visualizationImage,
  });

  @override
  List<Object?> get props {
    return [
      yearsOfExperience,
      salariesEntity,
      predictStatus,
      visualizationImage,
    ];
  }

  factory PredictState.initial() {
    return PredictState(
      yearsOfExperience: FormValue(
        value: '',
        validationStatus: ValidationStatus.initial,
      ),
      predictStatus: PredictStatus.idle,
    );
  }

  PredictState copyWith({
    FormValue<String>? yearsOfExperience,
    SalariesEntity? salariesEntity,
    PredictStatus? predictStatus,
    Uint8List? visualizationImage,
  }) {
    return PredictState(
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      salariesEntity: salariesEntity ?? this.salariesEntity,
      predictStatus: predictStatus ?? this.predictStatus,
      visualizationImage: visualizationImage ?? this.visualizationImage,
    );
  }
}
