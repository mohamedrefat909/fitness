import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response_model.g.dart';

@JsonSerializable()
class VerifyResetCodeResponseModel {
  final String? message;  

  const VerifyResetCodeResponseModel({
    this.message,
  });

  factory VerifyResetCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseModelToJson(this);
}
