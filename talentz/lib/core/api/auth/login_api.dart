import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../constants/api_const/api_const.dart';
import '../../interceptor/app_dio.dart';
import 'package:crypto/crypto.dart';

class LoginAPI {
  Future login({

    required String token,

  }) async {
    const String subUrl = "/session/token";
    const String uri = AppAPI.baseUrl + subUrl;
    var appleInBytes = utf8.encode("${AppAPI.apiKey}$token${AppAPI.apiSecret}");
    dynamic value = sha256.convert(appleInBytes);
    // print(value.toString());
    final bodyData = {
      "api_key": AppAPI.apiKey,
    "request_token": token,
    "checksum": value.toString()
    };

    final response = await Api().dio.post(
      uri,
      data: bodyData,
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