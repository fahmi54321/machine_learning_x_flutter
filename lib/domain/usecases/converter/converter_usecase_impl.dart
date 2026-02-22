import 'dart:convert';
import 'dart:typed_data';

import 'package:machine_learning_x_flutter/presentation/usecases/converter/converter_usecase.dart';

class ConverterUsecaseImpl implements ConverterUsecase {
  @override
  double stringToDouble({required String value}) {
    try {
      if (value.isNotEmpty) {
        final data = double.parse(value);
        return data;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  @override
  int stringToInt({required String value}) {
    try {
      if (value.isNotEmpty) {
        final data = int.parse(value);
        return data;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  @override
  Uint8List? base64ToUint8List({required String val}) {
    try {
      if (val.isNotEmpty) {
        final data = base64Decode(val);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
