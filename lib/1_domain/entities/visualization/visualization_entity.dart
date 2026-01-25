import 'package:equatable/equatable.dart';

class VisualizationEntity extends Equatable {
  final String imageBase64;
  const VisualizationEntity({required this.imageBase64});

  @override
  List<Object> get props => [imageBase64];
}
