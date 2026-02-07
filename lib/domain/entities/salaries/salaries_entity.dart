// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:machine_learning_x_flutter/domain/entities/prediction/prediction_entity.dart';
import 'package:machine_learning_x_flutter/domain/entities/visualization/visualization_entity.dart';

class SalariesEntity extends Equatable {
  final String explanation;
  final PredictionEntity? predictionEntity;
  final VisualizationEntity? visualization;
  const SalariesEntity({
    required this.explanation,
    this.predictionEntity,
    this.visualization,
  });

  @override
  List<Object?> get props => [explanation, predictionEntity, visualization];
}
