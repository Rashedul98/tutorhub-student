import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:tutorhub/utilities/functions/prints.dart';

class DioService {
  Dio dio = Dio();

  Future<void> create(String baseUrl) async {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
    );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        printer("= = = Dio Request = = =");
        printer(options.headers);
        printer(options.contentType);
        printer(options.extra);
        printer("${options.baseUrl}${options.path}");
        printer(options.data);

        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        printer("= = = Dio Error Response = = =");
        printer('Error Response: ${error.response}');
        printer('Error Message: ${error.message}');
        printer('Error Type: ${error.type}');
        printer('Error statusCode: ${error.response?.statusCode}');
        printer('Error statusMessage: ${error.response?.statusMessage}');

        return handler.next(error);
      },
      onResponse: (response, handler) {
        printer("= = = Dio Success Response = = =");
        printer(response.headers);
        printer(response.requestOptions.baseUrl + response.requestOptions.path);
        printer(response.statusCode);
        printer(response.extra);
        printer(json.encode(response.data));

        return handler.next(response);
      },
    ));
  }
}
