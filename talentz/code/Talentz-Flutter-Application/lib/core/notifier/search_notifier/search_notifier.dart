import 'package:flutter/material.dart';
import 'package:talentz/constants/values_manger.dart';
import 'package:talentz/core/api/search_api/search_with_name.dart';

import '../../../constants/constants.dart';
import '../../../models/search_with_name_model.dart';
import '../../api/search_api/search_with_skill.dart';
import '../../service/shared_preferance_service.dart';

class SearchNotifier extends ChangeNotifier {
  final SearchWithSkillApi _searchWithSkillAPI = SearchWithSkillApi();
  final SearchWithNameApi _searchWithNameAPI = SearchWithNameApi();

  bool _isLoading = false;
  int? _statusCode;
  SkillsModel? _values;

  bool get getIsLoading => _isLoading;
  int? get getStatusCode => _statusCode;
  SkillsModel? get getResultModel => _values;

  CacheService cashService = CacheService();

  Future<void> searchWithSkillNotifier(String skill) async {
    try {
      _isLoading = true;
      notifyListeners();
      final listData = await _searchWithSkillAPI
          .searchWithSkill(skill: skill)
          .timeout(const Duration(seconds: DurationConstant.d30));
      final parsedData = listData["responses"][0]["message"]["catalog"];
      if (listData["responses"] != null || listData["responses"].isNotEmpty) {
        _values = SkillsModel.fromJson(parsedData);
      } else {
        showSnackBar(text: listData["message"]);
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchWithName(String name) async {
    try {
      _isLoading = true;
      notifyListeners();
      final listData = await _searchWithNameAPI
          .searchWithName(name)
          .timeout(const Duration(seconds: DurationConstant.d30));
      final parsedData = listData["responses"][0]["message"]["catalog"];
      if (listData["responses"] != null || listData["responses"].isNotEmpty) {
        _values = SkillsModel.fromJson(parsedData);
      } else {
        showSnackBar(text: listData["message"]);
      }
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
