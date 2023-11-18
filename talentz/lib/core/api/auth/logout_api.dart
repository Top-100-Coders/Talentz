import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../constants/api_const/api_const.dart';
import '../../interceptor/app_dio.dart';
import 'package:crypto/crypto.dart';

class LogoutAPI {
  Future logout({
    required String token,
  }) async {
    const String subUrl = "/session/token";
    const String uri = AppAPI.baseUrl + subUrl;
    final response = await Api().dio.delete(
      uri,
      queryParameters: {
        "api_key": AppAPI.apiKey,
        "access_token": token
      },
      options: Options(
        headers: {"accept": "*/*'", "Accept-Encoding" : "gzip, deflate, br","Connection":"keep-alive","X-Kite-Version":"3"},
        contentType: 'application/x-www-form-urlencoded',
      ),
    );

    final statusCode = response.statusCode;

    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }
}