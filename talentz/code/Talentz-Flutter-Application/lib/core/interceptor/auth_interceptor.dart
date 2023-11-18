import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talentz/constants/api_const/api_const.dart';
import '../../constants/app_routes.dart';
import '../../constants/string_manager.dart';
import '../../main.dart';
import '../service/shared_preferance_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;

  AuthInterceptor(this._dio);

  String? accessToken;
  final CacheService cacheService = CacheService();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final listOfPaths = <String>[

    ];

    if (listOfPaths.contains(options.path.toString())) {
      return handler.next(options);
    }

    final token= await cacheService.readCache(key: AppStrings.token);
    options.headers.addAll({'Authorization': 'Bearer $token'});


    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if ((err.response?.statusCode == 401 &&
        err.response?.data["message"] == "Session Expired, Please Login Again")) {
      // print("Token expired ");
      accessToken = null;
      cacheService.deleteCache();

      const SnackBar snackBar = SnackBar(
          backgroundColor: Colors.red, content: Text("Session Expired"));
      snackbarKey.currentState?.showSnackBar(snackBar);
      navigatorKey.currentState!.pushNamedAndRemoveUntil(loginRoute, (route) => false);
      // if (await refreshToken()) {
      //   print("Token expired checked");
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> refreshToken() async {
    final refreshToken = await cacheService.readCache(key: AppStrings.refreshToken);
    final response = await _dio.post('/auth/refresh', data: {'refreshToken': refreshToken});
    print('refresh code${response.statusCode}');
    if (response.statusCode == 201) {
      accessToken = response.data;
      return true;
    } else {
      // refresh token is wrong
      print("refresh token expired");
      accessToken = null;
      cacheService.deleteCache();
      return false;
    }
    }
}