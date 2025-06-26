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

import '../../features/auth/forgot_password/data/datasources/contract/reset_password_contract_data_source.dart'
    as _i99;
import '../../features/auth/forgot_password/data/datasources/contract/send_email_contract_data_source.dart'
    as _i675;
import '../../features/auth/forgot_password/data/datasources/contract/verify_reset_code_contract_data_source.dart'
    as _i166;
import '../../features/auth/forgot_password/data/datasources/remote/reset_password_remote_data_source.dart'
    as _i887;
import '../../features/auth/forgot_password/data/datasources/remote/send_email_remote_data_source.dart'
    as _i190;
import '../../features/auth/forgot_password/data/datasources/remote/verify_reset_code_remote_data_source.dart'
    as _i184;
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
    gh.factory<_i570.SendEmailRepository>(
      () => _i897.SendEmailRepoImpl(gh<_i190.SendEmailRemoteDataSource>()),
    );
    gh.factory<_i675.SendEmailContractDataSource>(
      () => _i190.SendEmailRemoteDataSource(gh<_i266.RestClient>()),
    );
    gh.factory<_i99.ResetPasswordContractDataSource>(
      () => _i887.ResetPasswordRemoteDataSource(gh<_i266.RestClient>()),
    );
    gh.factory<_i166.VerifyResetCodeContractDataSource>(
      () => _i184.VerifyResetCodeRemoteDataSource(gh<_i266.RestClient>()),
    );
    gh.factory<_i963.ResetPasswordRepository>(
      () => _i772.ResetPasswordRepoImpl(
        gh<_i887.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i166.VerifyResetCodeRepository>(
      () => _i170.VerifyResetCodeRepoImpl(
        gh<_i184.VerifyResetCodeRemoteDataSource>(),
      ),
    );
    gh.factory<_i468.SendEmailUseCase>(
      () => _i468.SendEmailUseCase(gh<_i570.SendEmailRepository>()),
    );
    gh.factory<_i531.ResetPasswordUseCase>(
      () => _i531.ResetPasswordUseCase(gh<_i963.ResetPasswordRepository>()),
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
