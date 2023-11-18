import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../constants/app_routes.dart';
import '../../../constants/constants.dart';
import '../../../constants/string_manager.dart';

import '../../../models/search_with_name_model.dart';
import '../../api/search_api/searchWithName.dart';
import '../../service/shared_preferance_service.dart';


class SearchNotifier extends ChangeNotifier {
  final SearchWithNameApi _loginAPI = SearchWithNameApi();

  bool _isLoading = false;
  int? _statusCode;
  List<SkillsModel>? _values;

  bool get getIsLoading => _isLoading;
  int? get getStatusCode => _statusCode;
  List<SkillsModel>? get getResultModel => _values;
  
  CacheService cashService = CacheService();

  Future<void> searchWithNameNotifier({
    required BuildContext context,
    required String skill
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final listData = await _loginAPI.searchWithName(skill: skill);
      if(listData["responses"] != null ||listData["responses"].isNotEmpty){
        // _values = SkillsModel.fromJson(listData);
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