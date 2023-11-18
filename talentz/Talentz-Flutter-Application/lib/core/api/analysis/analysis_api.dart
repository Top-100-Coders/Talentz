import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../constants/api_const/api_const.dart';
import '../../interceptor/app_dio.dart';
import 'package:crypto/crypto.dart';

class AnalysisApi {
  Future analysisApi({
    required String base64Image,
  }) async {
    const String subUrl = "/v1/chat/completions";
    const String uri = AppAPI.openAIBaseUrl + subUrl;
    final bodyData = json.encode({
      "model": "gpt-4-vision-preview",
      "messages": [
        {
          "role": "user",
          "content": [
            {
              "type": "text",
              // "text": "Analyse the given stock and do a technical and price action analysis with the given details, Just list out your findings by points here. if user upload any  data or image other than stock market related just say them sorry i can not assist you on this, please try again. Also the response you send is directly shown to the customer, so do not put warning like I cant say.  "
              "text": "Analyse the given stock and do a technical and price action analysis with the given details, Just list out your findings by points here. Also the response you send is directly shown to the customer, so do not put warning like I cant say.  "
            },
            {
              "type": "image_url",
              "image_url": {
                "url": "data:image/jpeg;base64,$base64Image"
              }
            }
          ]
        }
      ],
      "max_tokens": 1000
    });
    final response = await Api().dio.post(
      uri,
      data: bodyData,
      options: Options(
        contentType: 'application/json',
      ),
    );
    final statusCode = response.statusCode;
    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }}