import 'package:dio/dio.dart';
import 'package:fitness/core/models/user_model.dart';
import 'package:fitness/features/auth/login/data/model/login_user_dto.dart';

import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://fitness.elevateegy.com/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
  @POST('auth/signin')
  Future<LoginResponse> login(@Body() Map<String, dynamic> map);
}
