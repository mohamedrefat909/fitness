// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api_manager/api_di.dart' as _i772;
import '../core/api_manager/api_manager.dart' as _i787;
import '../features/auth/login/data/datasource_contract/login_datasource.dart'
    as _i18;
import '../features/auth/login/data/datasource_impl/login_datasource_impl.dart'
    as _i163;
import '../features/auth/login/data/repository_impl/login_repo_impl.dart'
    as _i749;
import '../features/auth/login/domain/repository_contract/login_repo.dart'
    as _i161;
import '../features/auth/login/domain/usecases/login_usecases.dart' as _i230;
import '../features/auth/login/presentation/cubit/login_cubit.dart' as _i596;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjection = _$DioInjection();
    gh.singleton<_i361.Dio>(() => dioInjection.injectDio());
    gh.singleton<_i787.RestClient>(
      () => dioInjection.injectRestClient(gh<_i361.Dio>()),
    );
    gh.factory<_i18.LoginDataSource>(
      () => _i163.LoginDatasourceImpl(restClient: gh<_i787.RestClient>()),
    );
    gh.factory<_i161.LoginRepository>(
      () => _i749.LoginRepositoryImpl(
        loginDataSource: gh<_i18.LoginDataSource>(),
      ),
    );
    gh.factory<_i230.LoginUseCase>(
      () => _i230.LoginUseCase(loginRepository: gh<_i161.LoginRepository>()),
    );
    gh.factory<_i596.LoginCubit>(
      () => _i596.LoginCubit(loginUseCase: gh<_i230.LoginUseCase>()),
    );
    return this;
  }
}

class _$DioInjection extends _i772.DioInjection {}
