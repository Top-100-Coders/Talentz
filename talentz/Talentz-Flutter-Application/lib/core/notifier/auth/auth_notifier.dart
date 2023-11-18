import 'dart:io';
import 'package:flutter/material.dart';

import '../../../constants/app_routes.dart';
import '../../../constants/constants.dart';
import '../../../constants/string_manager.dart';
import '../../../models/auth_model/auth_model.dart';
import '../../../models/auth_model/auth_result_model.dart';
import '../../api/auth/login_api.dart';
import '../../service/shared_preferance_service.dart';


class LoginNotifier extends ChangeNotifier {
  final LoginAPI _loginAPI = LoginAPI();

  bool _isLoading = false;
  int? _statusCode;
  LoginModel? _values;

  bool get getIsLoading => _isLoading;
  int? get getStatusCode => _statusCode;
  LoginModel? get getLoginResultModel => _values;
  
  CacheService cashService = CacheService();

  Future<void> getLogin({
    required BuildContext context,
    required String token,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final listData = await _loginAPI.login(token: token);
      // _statusCode = listData["statusCode"];
      if(listData["status"] == "success"){
        // print(listData);
        cashService.writeCache(key: AppStrings.token, value: listData["data"]["access_token"]);
        cashService.writeCache(key: AppStrings.refreshToken, value: listData["data"]["refresh_token"]);
        cashService.writeCache(key: AppStrings.publicToken, value: listData["data"]["public_token"]);
        _values = LoginModel.fromJson(listData);
        Navigator.pushReplacementNamed(context, mainRoute);
      }else{
        showSnackBar(context: context, text: listData["message"]);
      }
      _isLoading = false;
      notifyListeners();
    } catch(error){
      rethrow;
}
}
}