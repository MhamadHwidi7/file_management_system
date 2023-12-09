// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import 'core/api/api_consumer.dart' as _i8;
import 'core/api/dio_consumer.dart' as _i9;
import 'core/api/logging_interceptor.dart' as _i5;
import 'core/network/network_info.dart' as _i6;
import 'core/third_party_injection.dart' as _i52;
import 'core/utils/shared_preferences_utils.dart' as _i7;
import 'features/admin/auth/data/data_source/remote_data_source/remote_data_source.dart'
    as _i31;
import 'features/admin/auth/data/repository/repository_impl.dart' as _i33;
import 'features/admin/auth/domain/repository/base_repository.dart' as _i32;
import 'features/admin/auth/domain/use_cases/log_in_use_case.dart' as _i34;
import 'features/admin/auth/domain/use_cases/sign_up_use_case.dart' as _i35;
import 'features/admin/auth/presentation/manager/log_in_cubit.dart' as _i45;
import 'features/admin/auth/presentation/manager/sign_up_cubit.dart' as _i46;
import 'features/admin/files/data/data_source/remote_data_source/remote_data_source.dart'
    as _i14;
import 'features/admin/files/data/repository/repository_impl.dart' as _i37;
import 'features/admin/files/domain/repository/base_repository.dart' as _i36;
import 'features/admin/files/domain/use_cases/change_file_number_use_case.dart'
    as _i38;
import 'features/admin/files/domain/use_cases/get_files_group_use_case.dart'
    as _i40;
import 'features/admin/files/domain/use_cases/get_files_system_use_case.dart'
    as _i41;
import 'features/admin/files/domain/use_cases/get_system_groups_use_case.dart'
    as _i43;
import 'features/admin/files/presentation/manager/change_file_number_cubit.dart'
    as _i50;
import 'features/admin/files/presentation/manager/files_cubit.dart' as _i51;
import 'features/admin/files/presentation/manager/system_groups_cubit.dart'
    as _i48;
import 'features/user/auth/log_in/data/data_source/remote_data_source/remote_data_source.dart'
    as _i19;
import 'features/user/auth/log_in/data/repository/repository_impl.dart' as _i21;
import 'features/user/auth/log_in/domain/repository/base_repository.dart'
    as _i20;
import 'features/user/auth/log_in/domain/use_cases/log_in_use_case.dart'
    as _i22;
import 'features/user/auth/log_in/presentation/manager/log_in_cubit.dart'
    as _i44;
import 'features/user/auth/sign_up/data/data_source/remote_data_source/remote_data_source.dart'
    as _i23;
import 'features/user/auth/sign_up/data/repository/repository_impl.dart'
    as _i25;
import 'features/user/auth/sign_up/domain/repository/base_repository.dart'
    as _i24;
import 'features/user/auth/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i26;
import 'features/user/auth/sign_up/presentation/manager/sign_up_cubit.dart'
    as _i47;
import 'features/user/files/add_file/data/data_source/remote_data_source/remote_data_source.dart'
    as _i27;
import 'features/user/files/add_file/data/repository/repository_impl.dart'
    as _i29;
import 'features/user/files/add_file/domain/repository/base_repository.dart'
    as _i28;
import 'features/user/files/add_file/domain/use_case/add_file_use_case.dart'
    as _i30;
import 'features/user/files/add_file/presentation/manager/add_file_cubit.dart'
    as _i49;
import 'features/user/files/delete_file/data/data_source/remote_data_source/remote_data_source.dart'
    as _i10;
import 'features/user/files/delete_file/data/repository/repository_impl.dart'
    as _i12;
import 'features/user/files/delete_file/domain/repository/base_repository.dart'
    as _i11;
import 'features/user/files/delete_file/domain/use_case/delete_file_use_case.dart'
    as _i13;
import 'features/user/files/delete_file/presentation/manager/delete_file_cubit.dart'
    as _i39;
import 'features/user/files/get_my_file/data/data_source/remote_data_source/remote_data_source.dart'
    as _i15;
import 'features/user/files/get_my_file/data/repository/repository_impl.dart'
    as _i17;
import 'features/user/files/get_my_file/domain/repository/base_repository.dart'
    as _i16;
import 'features/user/files/get_my_file/domain/use_case/get_my_files_use_case.dart'
    as _i18;
import 'features/user/files/get_my_file/presentation/manager/get_my_files_cubit.dart'
    as _i42;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyInjection = _$ThirdPartyInjection();
    gh.singleton<_i3.Dio>(thirdPartyInjection.dio);
    gh.singleton<_i4.InternetConnectionChecker>(
        thirdPartyInjection.internetConnectionChecker);
    gh.singleton<_i5.LoggingInterceptor>(_i5.LoggingInterceptor());
    gh.lazySingleton<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl(
        connectionChecker: gh<_i4.InternetConnectionChecker>()));
    gh.singleton<_i7.SharedPreferencesUtils>(_i7.SharedPreferencesUtils());
    gh.singleton<_i8.ApiConsumer>(_i9.DioConsumer(
      gh<_i3.Dio>(),
      gh<_i7.SharedPreferencesUtils>(),
    ));
    gh.singleton<_i10.DeleteFileBaseRemoteDataSource>(
        _i10.DeleteFileRemoteDataSource(gh<_i8.ApiConsumer>()));
    gh.singleton<_i11.DeleteFileBaseRepository>(_i12.DeleteFileRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i10.DeleteFileBaseRemoteDataSource>(),
    ));
    gh.singleton<_i13.DeleteFileUseCase>(
        _i13.DeleteFileUseCase(gh<_i11.DeleteFileBaseRepository>()));
    gh.singleton<_i14.GetAllFilesSystemBaseRemoteDataSource>(
        _i14.GetAllGroupsSystemRemoteDataSource(gh<_i8.ApiConsumer>()));
    gh.singleton<_i15.GetMyFilesBaseRemoteDataSource>(
        _i15.GetMyFilesRemoteDataSourceImpl(gh<_i8.ApiConsumer>()));
    gh.singleton<_i16.GetMyFilesBaseRepository>(_i17.GetMyFilesRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i15.GetMyFilesBaseRemoteDataSource>(),
    ));
    gh.singleton<_i18.GetMyFilesUseCase>(
        _i18.GetMyFilesUseCase(gh<_i16.GetMyFilesBaseRepository>()));
    gh.singleton<_i19.LogInBaseRemoteDataSource>(
        _i19.LogInRemoteDataSourceImpl(gh<_i8.ApiConsumer>()));
    gh.singleton<_i20.LogInBaseRepository>(_i21.LogInRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i19.LogInBaseRemoteDataSource>(),
    ));
    gh.singleton<_i22.LogInUseCase>(
        _i22.LogInUseCase(gh<_i20.LogInBaseRepository>()));
    gh.singleton<_i23.SignUpBaseRemoteDataSource>(
        _i23.SignUpRemoteDataSourceImpl(gh<_i8.ApiConsumer>()));
    gh.singleton<_i24.SignUpBaseRepository>(_i25.SignUpRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i23.SignUpBaseRemoteDataSource>(),
    ));
    gh.singleton<_i26.SignUpUseCase>(
        _i26.SignUpUseCase(gh<_i24.SignUpBaseRepository>()));
    gh.singleton<_i27.AddFileBaseRemoteDataSource>(
        _i27.AddFileRemoteDataSource(gh<_i8.ApiConsumer>()));
    gh.singleton<_i28.AddFileBaseRepsitory>(_i29.AddFileRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i27.AddFileBaseRemoteDataSource>(),
    ));
    gh.singleton<_i30.AddFileUseCase>(
        _i30.AddFileUseCase(gh<_i28.AddFileBaseRepsitory>()));
    gh.singleton<_i31.AdminAuthBaseRemoteDataSource>(
        _i31.AdminAuthRemoteDataSourceImpl(gh<_i8.ApiConsumer>()));
    gh.singleton<_i32.AdminAuthBaseRepository>(_i33.AdminAuthRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i31.AdminAuthBaseRemoteDataSource>(),
    ));
    gh.singleton<_i34.AdminLogInUseCase>(
        _i34.AdminLogInUseCase(gh<_i32.AdminAuthBaseRepository>()));
    gh.singleton<_i35.AdminSignUpUseCase>(
        _i35.AdminSignUpUseCase(gh<_i32.AdminAuthBaseRepository>()));
    gh.singleton<_i36.AdminSystemBaseRepository>(_i37.AdminSystemRepositoryImpl(
      gh<_i6.NetworkInfo>(),
      gh<_i14.GetAllFilesSystemBaseRemoteDataSource>(),
    ));
    gh.singleton<_i38.ChangeFileNumberUseCase>(
        _i38.ChangeFileNumberUseCase(gh<_i36.AdminSystemBaseRepository>()));
    gh.factory<_i39.DeleteFileCubit>(
        () => _i39.DeleteFileCubit(gh<_i13.DeleteFileUseCase>()));
    gh.singleton<_i40.GetFilesGroupUseCase>(
        _i40.GetFilesGroupUseCase(gh<_i36.AdminSystemBaseRepository>()));
    gh.singleton<_i41.GetFilesSystemUseCase>(
        _i41.GetFilesSystemUseCase(gh<_i36.AdminSystemBaseRepository>()));
    gh.factory<_i42.GetMyFilesCubit>(
        () => _i42.GetMyFilesCubit(gh<_i18.GetMyFilesUseCase>()));
    gh.singleton<_i43.GetSystemGroupsUseCase>(
        _i43.GetSystemGroupsUseCase(gh<_i36.AdminSystemBaseRepository>()));
    gh.factory<_i44.LogInCubit>(() => _i44.LogInCubit(
          gh<_i22.LogInUseCase>(),
          gh<_i7.SharedPreferencesUtils>(),
        ));
    gh.factory<_i45.LogInCubit>(() => _i45.LogInCubit(
          gh<_i34.AdminLogInUseCase>(),
          gh<_i7.SharedPreferencesUtils>(),
        ));
    gh.factory<_i46.SignUpCubit>(
        () => _i46.SignUpCubit(gh<_i35.AdminSignUpUseCase>()));
    gh.factory<_i47.SignUpCubit>(
        () => _i47.SignUpCubit(gh<_i26.SignUpUseCase>()));
    gh.factory<_i48.SystemGroupsCubit>(
        () => _i48.SystemGroupsCubit(gh<_i43.GetSystemGroupsUseCase>()));
    gh.factory<_i49.AddFileCubit>(
        () => _i49.AddFileCubit(gh<_i30.AddFileUseCase>()));
    gh.factory<_i50.ChangeFileNumberCubit>(
        () => _i50.ChangeFileNumberCubit(gh<_i38.ChangeFileNumberUseCase>()));
    gh.factory<_i51.GetAllFilesSystemCubit>(() => _i51.GetAllFilesSystemCubit(
          gh<_i41.GetFilesSystemUseCase>(),
          gh<_i40.GetFilesGroupUseCase>(),
        ));
    return this;
  }
}

class _$ThirdPartyInjection extends _i52.ThirdPartyInjection {}
