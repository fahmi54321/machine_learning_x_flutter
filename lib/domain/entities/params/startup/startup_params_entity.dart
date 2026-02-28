import 'package:machine_learning_x_flutter/domain/entities/params/params_entity.dart';

class PredictStartupParamsEntity extends ParamsEntity {
  final double rdSpend;
  final double administration;
  final double marketingSpend;
  final String state;
  PredictStartupParamsEntity({
    required this.rdSpend,
    required this.administration,
    required this.marketingSpend,
    required this.state,
  });

  @override
  List<Object?> get props => [rdSpend, administration, marketingSpend, state];
}
