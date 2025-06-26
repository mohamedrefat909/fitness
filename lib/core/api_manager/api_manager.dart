import 'package:dio/dio.dart';
import 'package:fitness/core/api_manager/api_constants.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/reset_password_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/send_email_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/request/verify_reset_code_request_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/reset_password_response_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/send_email_response_model.dart';
import 'package:fitness/features/auth/forgot_password/data/models/response/verify_reset_code_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://fitness.elevateegy.com/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
  @POST(ApiConstants.sendEmail)
  Future<SendEmailResponseModel> sendEmail(
      @Body() SendEmailRequestModel requestModel,
      );
  @POST(ApiConstants.verifyCode)
  Future<VerifyResetCodeResponseModel> verifyCode(
      @Body() VerifyResetCodeRequestModel requestModel,
      );
  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(
      @Body() ResetPasswordRequestModel requestModel,
      );


}