import 'package:flutter/material.dart';
import 'package:talentz/constants/values_manger.dart';

import '../../../constants/constants.dart';
import '../../../models/search_with_name_model.dart';
import '../../api/search_api/searchWithName.dart';
import '../../service/shared_preferance_service.dart';

class SearchNotifier extends ChangeNotifier {
  final SearchWithNameApi _loginAPI = SearchWithNameApi();

  bool _isLoading = false;
  int? _statusCode;
  SkillsModel? _values;

  bool get getIsLoading => _isLoading;
  int? get getStatusCode => _statusCode;
  SkillsModel? get getResultModel => _values;

  CacheService cashService = CacheService();

  Future<void> searchWithNameNotifier(
      {required BuildContext context, required String skill}) async {
    try {
      _isLoading = true;
      notifyListeners();
      final listData = await _loginAPI.searchWithName(skill: skill).timeout(const Duration(seconds: DurationConstant.d30));
      final parsedData = listData["responses"][0]["message"]["catalog"];
      if (listData["responses"] != null || listData["responses"].isNotEmpty) {
        _values = SkillsModel.fromJson(parsedData);
      } else {
        showSnackBar(context: context, text: listData["message"]);
      }
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
