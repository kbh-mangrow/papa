
import 'package:dio/dio.dart';

class NetworkConfig {
  static String baseUrl = '';
}
class Network {
  static Dio create({
    String? baseUrl,
    String? token,
    Map<String, String>? headers,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? NetworkConfig.baseUrl,
        connectTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Content-Type": "application/json",
          "Accept-Encoding": "identity",
        },
      ),
    );

    // Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Authorization
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }

          // custom headers
          if (headers != null) {
            options.headers.addAll(headers);
          }

          print("REQUEST: ${options.method} ${options.uri}");
          print("HEADERS: ${options.headers}");
          print("BODY: ${options.data}");

          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("RESPONSE: ${response.statusCode}");
          print("DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (e, handler) {
          print("ERROR: ${e.message}");
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}