import 'package:flutter/material.dart';

import 'package:machine_learning_x_flutter/domain/entities/camera/camera_result.dart';
import 'package:machine_learning_x_flutter/domain/entities/file/file_result.dart';
import 'package:machine_learning_x_flutter/domain/entities/params/food/food_params_entity.dart';
import 'package:machine_learning_x_flutter/presentation/app/app_state.dart';
import 'package:machine_learning_x_flutter/presentation/core/error/ui_error.dart';
import 'package:machine_learning_x_flutter/presentation/core/form/form_value.dart';
import 'package:machine_learning_x_flutter/presentation/core/permission/permission_status.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/provider/food_vision_state.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/camera/camera_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/converter/converter_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/file/file_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/food/food_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/food/validation/validation_food_usecase.dart';
import 'package:machine_learning_x_flutter/presentation/usecases/permission/permission_usecase.dart';

class FoodVisionProvider extends ChangeNotifier {
  final FoodUsecase foodUsecase;
  final ConverterUsecase converterUsecase;
  final FileUsecase fileUsecase;
  final CameraUsecase cameraUsecase;
  final ValidationFoodUsecase validationFoodUsecase;
  final PermissionUsecase permissionUsecase;
  final AppState appState;

  FoodVisionState _state = FoodVisionState.initial();

  FoodVisionProvider({
    required this.foodUsecase,
    required this.converterUsecase,
    required this.fileUsecase,
    required this.cameraUsecase,
    required this.validationFoodUsecase,
    required this.permissionUsecase,
    required this.appState,
  });
  FoodVisionState get state => _state;

  Future<void> predict() async {
    appState.setLoading(true);
    _state = _state.copyWith(status: FoodVisionStatus.loading);
    notifyListeners();

    final failureOrFood = await foodUsecase.predict(
      params: FoodParamsEntity(
        imagePath: _state.selectedImage?.path ?? '',
        trueLabel: _state.trueLabelValue.value,
      ),
    );
    appState.setLoading(false);
    failureOrFood.fold(
      (failure) {
        _state = _state.copyWith(status: FoodVisionStatus.error);
        notifyListeners();

        _handleFailure(failure.message);
      },
      (food) {
        _state = _state.copyWith(
          status: FoodVisionStatus.success,
          prediction: food.prediction,
          description: food.description,
          trueLabel: food.trueLabel,
          confidence: food.confidence,
          imageBase64: converterUsecase.base64ToUint8List(
            val: food.imageBase64,
          ),
        );
        notifyListeners();
      },
    );
  }

  Future<void> _cekPermissionFile() async {
    final failureOrStatus = await permissionUsecase.cekPermissionFile();
    failureOrStatus.fold(
      (failure) {
        _handleFailure(failure.message);
      },
      (status) {
        _state = _state.copyWith(permissionFileStatus: status);
        notifyListeners();
      },
    );
  }

  Future<void> _cekPermissionCamera() async {
    final failureOrStatus = await permissionUsecase.cekPermissionCamera();
    failureOrStatus.fold(
      (failure) {
        _handleFailure(failure.message);
      },
      (status) {
        _state = _state.copyWith(permissionCameraStatus: status);
        notifyListeners();
      },
    );
  }

  Future<void> _requestPermissionFile() async {
    final failureOrStatus = await permissionUsecase.reqPermissionFile();
    failureOrStatus.fold(
      (failure) {
        _handleFailure(failure.message);
      },
      (status) {
        _state = _state.copyWith(permissionFileStatus: status);
        notifyListeners();
      },
    );
  }

  Future<void> _requestPermissionCamera() async {
    final failureOrStatus = await permissionUsecase.reqPermissionCamera();
    failureOrStatus.fold(
      (failure) {
        _handleFailure(failure.message);
      },
      (status) {
        _state = _state.copyWith(permissionCameraStatus: status);
        notifyListeners();
      },
    );
  }

  void pickImageFromGallery() async {
    await _cekPermissionFile();

    if (_state.permissionFileStatus == AskPermissionStatus.granted) {
      fileUsecase.getFileFromGallery().then((failureOrPath) {
        failureOrPath.fold(
          (failure) {
            _state = _state.copyWith(
              imagePickerStatus: ImagePickerStatus.error,
            );
            notifyListeners();

            _handleFailure(failure.message);
          },
          (fileResult) {
            if (fileResult is FileCanceled) {
              // do nothing
            } else if (fileResult is FileSuccess) {
              _state = _state.copyWith(
                imagePickerStatus: ImagePickerStatus.success,
                selectedImage: converterUsecase.filePathToFile(
                  path: fileResult.path,
                ),
              );
              notifyListeners();
            }
          },
        );
      });
    } else {
      await _requestPermissionFile();
    }
  }

  void pickImageFromCamera() async {
    await _cekPermissionCamera();

    if (_state.permissionCameraStatus == AskPermissionStatus.granted) {
      cameraUsecase.getFileFromCamera().then((failureOrPath) {
        failureOrPath.fold(
          (failure) {
            _state = _state.copyWith(
              imagePickerStatus: ImagePickerStatus.error,
            );
            notifyListeners();
            _handleFailure(failure.message);
          },
          (cameraResult) {
            if (cameraResult is CameraCanceled) {
              // do nothing
            } else if (cameraResult is CameraSuccess) {
              _state = _state.copyWith(
                imagePickerStatus: ImagePickerStatus.success,
                selectedImage: converterUsecase.filePathToFile(
                  path: cameraResult.file.path,
                ),
              );
              notifyListeners();
            }
          },
        );
      });
    } else {
      await _requestPermissionCamera();
    }
  }

  void setTrueLabel(String value) {
    final status = validationFoodUsecase.trueLabelValidation(value: value);
    _state = _state.copyWith(
      trueLabelValue: FormValue(value: value, validationStatus: status),
    );
  }

  void _handleFailure(String message) {
    appState.setError(
      UiError(source: ErrorSource.foodVision, message: message),
    );
  }
}
