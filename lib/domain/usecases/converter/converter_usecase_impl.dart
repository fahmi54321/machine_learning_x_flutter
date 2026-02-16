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
}
