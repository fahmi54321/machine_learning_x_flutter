import 'dart:io';
import 'dart:typed_data';

abstract class ConverterUsecase {
  double stringToDouble({required String value});

  int stringToInt({required String value});

  Uint8List? base64ToUint8List({required String val});

  File? filePathToFile({required String path});
}
