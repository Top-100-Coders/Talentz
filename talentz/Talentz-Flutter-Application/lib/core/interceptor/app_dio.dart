import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/api_const/api_const.dart';
import '../../main.dart';
import 'auth_interceptor.dart';

class Api {
  final dio = createDio();

  // final tokenDio = Dio(BaseOptions(baseUrl: AppAPI.BaseUrl));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio();
    dio.options.baseUrl = AppAPI.baseUrl;
    dio.interceptors
    ..add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        requestBody: true))
      ..add(AuthInterceptor(dio))
      ..add(AppInterceptors(dio));

    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            const SnackBar snackBar = SnackBar(
                backgroundColor: Colors.red, content: Text("Something went wrong 400"));
            snackbarKey.currentState?.showSnackBar(snackBar);
            throw BadRequestException(err.requestOptions);
          case 401:
            const SnackBar snackBar = SnackBar(
                backgroundColor: Colors.red, content: Text("Something went wrong 401"));
            snackbarKey.currentState?.showSnackBar(snackBar);
            throw UnauthorizedException(err.requestOptions);
          case 404:
            const SnackBar snackBar = SnackBar(
                backgroundColor: Colors.red, content: Text("Something went wrong 404"));
            snackbarKey.currentState?.showSnackBar(snackBar);
            throw NotFoundException(err.requestOptions);
          case 409:
            const SnackBar snackBar = SnackBar(
                backgroundColor: Colors.red, content: Text("Something went wrong 409"));
            snackbarKey.currentState?.showSnackBar(snackBar);
            throw ConflictException(err.requestOptions);
          case 500:
            const SnackBar snackBar = SnackBar(
                backgroundColor: Colors.red, content: Text("Something went wrong 509"));
            snackbarKey.currentState?.showSnackBar(snackBar);
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        const SnackBar snackBar = SnackBar(
            backgroundColor: Colors.red, content: Text("No Internet Connection"));
        snackbarKey.currentState?.showSnackBar(snackBar);
      case DioExceptionType.badCertificate:
        const SnackBar snackBar = SnackBar(
            backgroundColor: Colors.red, content: Text("Bade Certificate"));
        snackbarKey.currentState?.showSnackBar(snackBar);
      case DioExceptionType.connectionTimeout:
        const SnackBar snackBar = SnackBar(
            backgroundColor: Colors.red, content: Text("Connection Timeout"));
        snackbarKey.currentState?.showSnackBar(snackBar);
      case DioExceptionType.sendTimeout:
          const SnackBar snackBar = SnackBar(
            backgroundColor: Colors.red, content: Text("Send Timeout Error"));
        snackbarKey.currentState?.showSnackBar(snackBar);
      case DioExceptionType.connectionError:
        const SnackBar snackBar = SnackBar(
            backgroundColor: Colors.red, content: Text("Send Timeout Error"));
        snackbarKey.currentState?.showSnackBar(snackBar);
    }
    return handler.next(err);
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
   }
}