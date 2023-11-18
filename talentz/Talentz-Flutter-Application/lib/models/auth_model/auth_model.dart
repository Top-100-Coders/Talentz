import 'package:json_annotation/json_annotation.dart';

import 'auth_result_model.dart';

part 'auth_model.g.dart';
@JsonSerializable(explicitToJson: true)
class LoginModel{
  final String? status;
  final LoginResultModel? data;

  LoginModel({
    this.status,
    this.data
});
  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}