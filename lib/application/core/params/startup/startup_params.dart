import 'package:machine_learning_x_flutter/application/core/params/params.dart';

class PredictStartupParams extends Params {
  final double rdSpend;
  final double administration;
  final double marketingSpend;
  final String state;
  PredictStartupParams({
    required this.rdSpend,
    required this.administration,
    required this.marketingSpend,
    required this.state,
  });

  @override
  List<Object?> get props => [rdSpend, administration, marketingSpend, state];
}
