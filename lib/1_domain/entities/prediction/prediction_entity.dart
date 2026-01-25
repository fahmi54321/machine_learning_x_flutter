import 'package:equatable/equatable.dart';

class PredictionEntity extends Equatable {
  final String currency;
  final double salary;
  const PredictionEntity({required this.currency, required this.salary});

  @override
  List<Object> get props => [currency, salary];
}
