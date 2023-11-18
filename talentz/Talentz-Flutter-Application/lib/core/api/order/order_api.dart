import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../constants/api_const/api_const.dart';
import '../../interceptor/app_dio.dart';
import 'package:crypto/crypto.dart';

class TradeAPI {
  Future tradeApi({
    required String tradingSymbol,
    required String exchange,
    required String transactionType,
    required String orderType,
    required String quantity,
    required String product,
    required String validity,
  }) async {
    const String subUrl = "/orders/regular";
    const String uri = AppAPI.baseUrl + subUrl;
    final bodyData = json.encode({
      "tradingsymbol":tradingSymbol,
      "exchange":exchange,
      "transaction_type":transactionType,
      "order_type":orderType,
      "quantity":quantity,
      "product":product,
      "validity":validity
    });
    final response = await Api().dio.post(
      uri,
      data: bodyData,
      options: Options(
        headers: {"accept": "*/*'", "Accept-Encoding" : "gzip, deflate, br","Connection":"keep-alive","X-Kite-Version":"3"},
        // contentType: 'application/x-www-form-urlencoded',
      ),
    );
    final statusCode = response.statusCode;
    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }}