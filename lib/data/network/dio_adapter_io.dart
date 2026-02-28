import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

HttpClientAdapter createHttpAdapter() {
  final adapter = IOHttpClientAdapter();

  adapter.createHttpClient = () {
    final client = HttpClient();

    // ⚠️ HANYA untuk dev / staging
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    return client;
  };

  return adapter;
}
