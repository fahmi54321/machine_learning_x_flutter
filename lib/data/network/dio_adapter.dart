import 'package:dio/dio.dart';

import 'dio_adapter_io.dart' if (dart.library.html) 'dio_adapter_web.dart';

HttpClientAdapter buildHttpAdapter() {
  return createHttpAdapter();
}
