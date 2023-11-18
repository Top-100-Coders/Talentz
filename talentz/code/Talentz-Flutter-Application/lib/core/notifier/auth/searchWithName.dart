import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../constants/app_routes.dart';
import '../../../constants/constants.dart';
import '../../../constants/string_manager.dart';
import '../../../models/auth_model/auth_model.dart';
import '../../../models/auth_model/auth_result_model.dart';
import '../../api/auth/searchWithName.dart';
import '../../service/shared_preferance_service.dart';


class SearchNotifier extends ChangeNotifier {
  final SearchWithName _loginAPI = SearchWithName();

  bool _isLoading = false;
  int? _statusCode;
  LoginModel? _values;

  bool get getIsLoading => _isLoading;
  int? get getStatusCode => _statusCode;
  LoginModel? get getLoginResultModel => _values;
  
  CacheService cashService = CacheService();

  Future<void> searchWithName({
    required BuildContext context,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final listData = await _loginAPI.searchWithName();
      // _statusCode = listData["statusCode"];
      log("lllllllll $listData");
      if(listData["status"] == "success"){
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