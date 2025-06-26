import 'package:json_annotation/json_annotation.dart';

part 'send_email_response_model.g.dart';
@JsonSerializable()

class SendEmailResponseModel {
  final String message;
  final String info;


  const SendEmailResponseModel({
    required this.message, required this.info
  });

  factory SendEmailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailResponseModelToJson(this);

}