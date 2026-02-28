// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/core/permission/permission_status.dart';

enum FoodVisionStatus { initial, loading, success, error }

enum ImagePickerStatus { initial, loading, success, error }

class FoodVisionState extends Equatable {
  final FoodVisionStatus status;
  final ImagePickerStatus imagePickerStatus;
  final AskPermissionStatus permissionFileStatus;
  final AskPermissionStatus permissionCameraStatus;
  final FormValue trueLabelValue;
  final String description;
  final String prediction;
  final String trueLabel;
  final double confidence;
  final Uint8List? imageBase64;
  final File? selectedImage;
  const FoodVisionState({
    required this.status,
    required this.imagePickerStatus,
    required this.permissionFileStatus,
    required this.permissionCameraStatus,
    required this.trueLabelValue,
    required this.description,
    required this.prediction,
    required this.trueLabel,
    required this.confidence,
    required this.imageBase64,
    this.selectedImage,
  });

  factory FoodVisionState.initial() {
    return FoodVisionState(
      status: FoodVisionStatus.initial,
      description: '',
      prediction: '',
      trueLabel: '',
      confidence: 0,
      imageBase64: null,
      imagePickerStatus: ImagePickerStatus.initial,
      selectedImage: null,
      trueLabelValue: FormValue(
        value: '',
        validationStatus: ValidationStatus.initial,
      ),
      permissionFileStatus: AskPermissionStatus.initial,
      permissionCameraStatus: AskPermissionStatus.initial,
    );
  }
  @override
  List<Object?> get props {
    return [
      status,
      imagePickerStatus,
      permissionFileStatus,
      permissionCameraStatus,
      trueLabelValue,
      description,
      prediction,
      trueLabel,
      confidence,
      imageBase64,
      selectedImage,
    ];
  }

  FoodVisionState copyWith({
    FoodVisionStatus? status,
    ImagePickerStatus? imagePickerStatus,
    AskPermissionStatus? permissionFileStatus,
    AskPermissionStatus? permissionCameraStatus,
    FormValue? trueLabelValue,
    String? description,
    String? prediction,
    String? trueLabel,
    double? confidence,
    Uint8List? imageBase64,
    File? selectedImage,
  }) {
    return FoodVisionState(
      status: status ?? this.status,
      imagePickerStatus: imagePickerStatus ?? this.imagePickerStatus,
      permissionFileStatus: permissionFileStatus ?? this.permissionFileStatus,
      permissionCameraStatus:
          permissionCameraStatus ?? this.permissionCameraStatus,
      trueLabelValue: trueLabelValue ?? this.trueLabelValue,
      description: description ?? this.description,
      prediction: prediction ?? this.prediction,
      trueLabel: trueLabel ?? this.trueLabel,
      confidence: confidence ?? this.confidence,
      imageBase64: imageBase64 ?? this.imageBase64,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }

  @override
  bool get stringify => true;
}
