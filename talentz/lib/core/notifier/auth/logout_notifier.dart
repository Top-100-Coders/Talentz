import 'package:flutter/material.dart';
import '../../../constants/app_routes.dart';
import '../../../constants/constants.dart';
import '../../../constants/string_manager.dart';
import '../../api/auth/logout_api.dart';
import '../../service/shared_preferance_service.dart';


class LogoutNotifier extends ChangeNotifier {
  final LogoutAPI _logoutAPI = LogoutAPI();

  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  CacheService cacheService = CacheService();

  Future<void> logout({
    required BuildContext context,
  }) async {
    try {
      final String token =await cacheService.readCache(key: AppStrings.token);
      _isLoading = true;
      notifyListeners();
      final data = await _logoutAPI.logout(token:token);
      if(data["status"] == "success"){
        Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
      }else{
        showSnackBar(context: context, text: data["message"]);
      }
      _isLoading = false;
      notifyListeners();
    } catch(error){
      rethrow;
    }
  }
}