import 'package:dio/dio.dart';
import 'package:fitness/core/models/user_model.dart';

import 'package:injectable/injectable.dart';

import 'api_manager.dart';

@module
abstract class DioInjection {
  @Singleton()
  Dio injectDio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 60),
        headers: {
          "token": UserModel.instance.token,
          'Authorization': 'Bearer ${UserModel.instance.token}',
        },
      ),
    );

    return dio;
  }

  @Singleton()
  RestClient injectRestClient(Dio dio) {
    return RestClient(dio);
  }
}