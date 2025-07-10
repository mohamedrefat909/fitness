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
import '../features/auth/forgot_password/data/data_sources/contract/reset_password_contract_data_source.dart'
    as _i676;
import '../features/auth/forgot_password/data/data_sources/contract/send_email_contract_data_source.dart'
    as _i186;
import '../features/auth/forgot_password/data/data_sources/contract/verify_reset_code_contract_data_source.dart'
    as _i357;
import '../features/auth/forgot_password/data/data_sources/remote/reset_password_remote_data_source.dart'
    as _i278;
import '../features/auth/forgot_password/data/data_sources/remote/send_email_remote_data_source.dart'
    as _i238;
import '../features/auth/forgot_password/data/data_sources/remote/verify_reset_code_remote_data_source.dart'
    as _i46;
import '../features/auth/forgot_password/data/repositories_impl/reset_password_repo_impl.dart'
    as _i382;
import '../features/auth/forgot_password/data/repositories_impl/send_email_repo_impl.dart'
    as _i449;
import '../features/auth/forgot_password/data/repositories_impl/verify_reset_code_repo_impl.dart'
    as _i717;
import '../features/auth/forgot_password/domain/repositories/reset_password_repository.dart'
    as _i351;
import '../features/auth/forgot_password/domain/repositories/send_email_repository.dart'
    as _i944;
import '../features/auth/forgot_password/domain/repositories/verify_reset_code_repository.dart'
    as _i8;
import '../features/auth/forgot_password/domain/usecases/reset_password_use_case.dart'
    as _i504;
import '../features/auth/forgot_password/domain/usecases/send_email_use_case.dart'
    as _i308;
import '../features/auth/forgot_password/domain/usecases/verify_reset_code_use_case.dart'
    as _i332;
import '../features/auth/forgot_password/presentation/cubit/forgot_pssword_cubit.dart'
    as _i144;
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
    gh.factory<_i186.SendEmailContractDataSource>(
      () => _i238.SendEmailRemoteDataSource(gh<_i787.RestClient>()),
    );
    gh.factory<_i676.ResetPasswordContractDataSource>(
      () => _i278.ResetPasswordRemoteDataSource(gh<_i787.RestClient>()),
    );
    gh.factory<_i357.VerifyResetCodeContractDataSource>(
      () => _i46.VerifyResetCodeRemoteDataSource(gh<_i787.RestClient>()),
    );
    gh.factory<_i351.ResetPasswordRepository>(
      () => _i382.ResetPasswordRepoImpl(
        gh<_i676.ResetPasswordContractDataSource>(),
      ),
    );
    gh.factory<_i18.LoginDataSource>(
      () => _i163.LoginDatasourceImpl(restClient: gh<_i787.RestClient>()),
    );
    gh.factory<_i944.SendEmailRepository>(
      () => _i449.SendEmailRepoImpl(gh<_i186.SendEmailContractDataSource>()),
    );
    gh.factory<_i161.LoginRepository>(
      () => _i749.LoginRepositoryImpl(
        loginDataSource: gh<_i18.LoginDataSource>(),
      ),
    );
    gh.factory<_i308.SendEmailUseCase>(
      () => _i308.SendEmailUseCase(gh<_i944.SendEmailRepository>()),
    );
    gh.factory<_i504.ResetPasswordUseCase>(
      () => _i504.ResetPasswordUseCase(gh<_i351.ResetPasswordRepository>()),
    );
    gh.factory<_i230.LoginUseCase>(
      () => _i230.LoginUseCase(loginRepository: gh<_i161.LoginRepository>()),
    );
    gh.factory<_i8.VerifyResetCodeRepository>(
      () => _i717.VerifyResetCodeRepoImpl(
        gh<_i357.VerifyResetCodeContractDataSource>(),
      ),
    );
    gh.factory<_i596.LoginCubit>(
      () => _i596.LoginCubit(loginUseCase: gh<_i230.LoginUseCase>()),
    );
    gh.factory<_i332.VerifyResetCodeUseCase>(
      () => _i332.VerifyResetCodeUseCase(gh<_i8.VerifyResetCodeRepository>()),
    );
    gh.factory<_i144.ForgotPasswordCubit>(
      () => _i144.ForgotPasswordCubit(
        forgotPasswordUseCase: gh<_i308.SendEmailUseCase>(),
        resetPasswordUseCase: gh<_i504.ResetPasswordUseCase>(),
        verifyResetUseCase: gh<_i332.VerifyResetCodeUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioInjection extends _i772.DioInjection {}
