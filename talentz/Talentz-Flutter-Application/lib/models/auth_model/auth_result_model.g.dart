// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResultModel _$LoginResultModelFromJson(Map<String, dynamic> json) =>
    LoginResultModel(
      userType: json['user_type'] as String?,
      email: json['email'] as String?,
      userName: json['user_name'] as String?,
      userShortname: json['user_shortname'] as String?,
      broker: json['broker'] as String?,
      exchanges: json['exchanges'] as List<dynamic>?,
      products: json['products'] as List<dynamic>?,
      orderTypes: json['order_types'] as List<dynamic>?,
      avatarUrl: json['avatar_url'] as String?,
      userid: json['user_id'] as String?,
      apiKey: json['api_key'] as String?,
      accessToken: json['access_token'] as String?,
      publicToken: json['public_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      encToken: json['enctoken'] as String?,
      loginTime: json['login_time'] == null
          ? null
          : DateTime.parse(json['login_time'] as String),
    );

Map<String, dynamic> _$LoginResultModelToJson(LoginResultModel instance) =>
    <String, dynamic>{
      'user_type': instance.userType,
      'email': instance.email,
      'user_name': instance.userName,
      'user_shortname': instance.userShortname,
      'broker': instance.broker,
      'exchanges': instance.exchanges,
      'products': instance.products,
      'order_types': instance.orderTypes,
      'avatar_url': instance.avatarUrl,
      'user_id': instance.userid,
      'api_key': instance.apiKey,
      'access_token': instance.accessToken,
      'public_token': instance.publicToken,
      'refresh_token': instance.refreshToken,
      'enctoken': instance.encToken,
      'login_time': instance.loginTime?.toIso8601String(),
    };
