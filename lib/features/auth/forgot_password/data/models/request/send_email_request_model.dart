import 'package:json_annotation/json_annotation.dart';

part 'send_email_request_model.g.dart';
@JsonSerializable()

class SendEmailRequestModel {
  final String email;


  const SendEmailRequestModel({
    required this.email,

  });

  factory SendEmailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendEmailRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailRequestModelToJson(this);

}