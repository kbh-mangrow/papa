
import 'package:dio/dio.dart';

import 'json/JSAuthReq.dart';

class IAuth {
  final Dio dio;
  IAuth(this.dio);
  Future<Response> request(JSAuthReq request) {
    return dio.post(
      "/api/user/verifyIdentity",
      data: request.toJson(),
    );
  }
}