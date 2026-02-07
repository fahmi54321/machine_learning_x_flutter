// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class StartupEntity extends Equatable {
  final String classification;
  final String description;
  final double predictedProfit;
  final List<String> recommendation;
  const StartupEntity({
    required this.classification,
    required this.description,
    required this.predictedProfit,
    required this.recommendation,
  });

  @override
  List<Object> get props => [
    classification,
    description,
    predictedProfit,
    recommendation,
  ];
}
