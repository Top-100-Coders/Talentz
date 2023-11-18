import 'package:json_annotation/json_annotation.dart';



part 'auth_result_model.g.dart';
@JsonSerializable(explicitToJson: true)
class LoginResultModel {
  @JsonKey(name: 'user_type')
  final String? userType;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'user_shortname')
  final String? userShortname;
  @JsonKey(name: 'broker')
  final String? broker;
  @JsonKey(name: 'exchanges')
  final List? exchanges;
  @JsonKey(name: 'products')
  final List? products;
  @JsonKey(name: 'order_types')
  final List? orderTypes;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'user_id')
  final String? userid;
  @JsonKey(name: 'api_key')
  final String? apiKey;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'public_token')
  final String? publicToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'enctoken')
  final String? encToken;
  @JsonKey(name: 'login_time')
  final DateTime? loginTime;

  LoginResultModel({
    this.userType,
    this.email,
    this.userName,
    this.userShortname,
    this.broker,
    this.exchanges,
    this.products,
    this.orderTypes,
    this.avatarUrl,
    this.userid,
    this.apiKey,
    this.accessToken,
    this.publicToken,
    this.refreshToken,
    this.encToken,
    this.loginTime,
  });

  factory LoginResultModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultModelToJson(this);
}
