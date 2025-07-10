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

import '../../features/auth/forgot_password/data/data_sources/contract/reset_password_contract_data_source.dart'
    as _i800;
import '../../features/auth/forgot_password/data/data_sources/contract/send_email_contract_data_source.dart'
    as _i109;
import '../../features/auth/forgot_password/data/data_sources/contract/verify_reset_code_contract_data_source.dart'
    as _i823;
import '../../features/auth/forgot_password/data/data_sources/remote/reset_password_remote_data_source.dart'
    as _i210;
import '../../features/auth/forgot_password/data/data_sources/remote/send_email_remote_data_source.dart'
    as _i639;
import '../../features/auth/forgot_password/data/data_sources/remote/verify_reset_code_remote_data_source.dart'
    as _i702;
import '../../features/auth/forgot_password/data/repositories_impl/reset_password_repo_impl.dart'
    as _i772;
import '../../features/auth/forgot_password/data/repositories_impl/send_email_repo_impl.dart'
    as _i897;
import '../../features/auth/forgot_password/data/repositories_impl/verify_reset_code_repo_impl.dart'
    as _i170;
import '../../features/auth/forgot_password/domain/repositories/reset_password_repository.dart'
    as _i963;
import '../../features/auth/forgot_password/domain/repositories/send_email_repository.dart'
    as _i570;
import '../../features/auth/forgot_password/domain/repositories/verify_reset_code_repository.dart'
    as _i166;
import '../../features/auth/forgot_password/domain/usecases/reset_password_use_case.dart'
    as _i531;
import '../../features/auth/forgot_password/domain/usecases/send_email_use_case.dart'
    as _i468;
import '../../features/auth/forgot_password/domain/usecases/verify_reset_code_use_case.dart'
    as _i832;
import '../../features/auth/forgot_password/presentation/cubit/forgot_pssword_cubit.dart'
    as _i321;
import '../../features/auth/login/data/datasource_contract/login_datasource.dart'
    as _i1040;
import '../../features/auth/login/data/datasource_impl/login_datasource_impl.dart'
    as _i675;
import '../../features/auth/login/data/repository_impl/login_repo_impl.dart'
    as _i580;
import '../../features/auth/login/domain/repository_contract/login_repo.dart'
    as _i1067;
import '../../features/auth/login/domain/usecases/login_usecases.dart' as _i286;
import '../../features/auth/login/presentation/cubit/login_cubit.dart' as _i126;
import '../api_manager/api_di.dart' as _i285;
import '../api_manager/api_manager.dart' as _i266;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjection = _$DioInjection();
    gh.singleton<_i361.Dio>(() => dioInjection.injectDio());
    gh.singleton<_i266.RestClient>(
      () => dioInjection.injectRestClient(gh<_i361.Dio>()),
    );
    gh.factory<_i109.SendEmailContractDataSource>(
      () => _i639.SendEmailRemoteDataSource(gh<_i266.RestClient>()),
    );
    gh.factory<_i800.ResetPasswordContractDataSource>(
      () => _i210.ResetPasswordRemoteDataSource(gh<_i266.RestClient>()),
    );
    gh.factory<_i823.VerifyResetCodeContractDataSource>(
      () => _i702.VerifyResetCodeRemoteDataSource(gh<_i266.RestClient>()),
    );
    gh.factory<_i963.ResetPasswordRepository>(
      () => _i772.ResetPasswordRepoImpl(
        gh<_i800.ResetPasswordContractDataSource>(),
      ),
    );
    gh.factory<_i1040.LoginDataSource>(
      () => _i675.LoginDatasourceImpl(restClient: gh<_i266.RestClient>()),
    );
    gh.factory<_i570.SendEmailRepository>(
      () => _i897.SendEmailRepoImpl(gh<_i109.SendEmailContractDataSource>()),
    );
    gh.factory<_i1067.LoginRepository>(
      () => _i580.LoginRepositoryImpl(
        loginDataSource: gh<_i1040.LoginDataSource>(),
      ),
    );
    gh.factory<_i468.SendEmailUseCase>(
      () => _i468.SendEmailUseCase(gh<_i570.SendEmailRepository>()),
    );
    gh.factory<_i531.ResetPasswordUseCase>(
      () => _i531.ResetPasswordUseCase(gh<_i963.ResetPasswordRepository>()),
    );
    gh.factory<_i286.LoginUseCase>(
      () => _i286.LoginUseCase(loginRepository: gh<_i1067.LoginRepository>()),
    );
    gh.factory<_i166.VerifyResetCodeRepository>(
      () => _i170.VerifyResetCodeRepoImpl(
        gh<_i823.VerifyResetCodeContractDataSource>(),
      ),
    );
    gh.factory<_i126.LoginCubit>(
      () => _i126.LoginCubit(loginUseCase: gh<_i286.LoginUseCase>()),
    );
    gh.factory<_i832.VerifyResetCodeUseCase>(
      () => _i832.VerifyResetCodeUseCase(gh<_i166.VerifyResetCodeRepository>()),
    );
    gh.factory<_i321.ForgotPasswordCubit>(
      () => _i321.ForgotPasswordCubit(
        forgotPasswordUseCase: gh<_i468.SendEmailUseCase>(),
        resetPasswordUseCase: gh<_i531.ResetPasswordUseCase>(),
        verifyResetUseCase: gh<_i832.VerifyResetCodeUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
