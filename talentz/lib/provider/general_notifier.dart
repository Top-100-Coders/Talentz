import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:talentz/constants/constants.dart';
import 'package:talentz/constants/string_manager.dart';

import '../constants/api_const/api_const.dart';
import '../core/service/shared_preferance_service.dart';

class GeneralNotifier extends ChangeNotifier {
  int _axisCount = 2;
  double _percent =0.00;
  bool _loginOnceMore = true;

  double? get getPercent => _percent;
  bool? get getLoginBool=> _loginOnceMore;
  int get getAxisCount => _axisCount;

  CacheService cashService = CacheService();


  void   setPercent(double per){
    _percent = per ;
    notifyListeners();
  }


  Future<void> checkAxisCount({required BuildContext context}) async {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1200) {
      _axisCount = 6;
    } else if (screenWidth > 1000) {
      _axisCount = 4;
    } else if (screenWidth > 800) {
      _axisCount = 4;
    } else if (screenWidth > 600) {
      _axisCount = 3;
    } else {
      _axisCount = 2;
    }
    notifyListeners();
  }




  Future<void> setTimer() async {

    _loginOnceMore = false;
    notifyListeners();
    Future.delayed(const Duration(minutes: 5), () {
      _loginOnceMore = true;
      notifyListeners();
    });


  }

  Future<void> setLoader() async {
    _percent = 0;
    notifyListeners();
    const totalMessages = 100;
    const totalTimeInSeconds = 2 * 60;
    final interval = Duration(milliseconds: (totalTimeInSeconds / totalMessages * 1000).round());

    Timer.periodic(interval, (timer) {
      _percent++;
      notifyListeners();
      if (_percent >= totalMessages) {
        timer.cancel();
      }
    });

  }
}