import 'package:equatable/equatable.dart';

class InsuranceEntity extends Equatable {
  final String description;
  final double predictedCharges;
  final String riskCategory;
  const InsuranceEntity({
    required this.description,
    required this.predictedCharges,
    required this.riskCategory,
  });

  InsuranceEntity copyWith({
    String? description,
    double? predictedCharges,
    String? riskCategory,
  }) {
    return InsuranceEntity(
      description: description ?? this.description,
      predictedCharges: predictedCharges ?? this.predictedCharges,
      riskCategory: riskCategory ?? this.riskCategory,
    );
  }

  @override
  List<Object> get props => [description, predictedCharges, riskCategory];
}
