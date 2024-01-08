// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_consumer.dart' as _i10;
import 'core/api/dio_consumer.dart' as _i5;
import 'core/api/logging_interceptor.dart' as _i6;
import 'core/third_party_injection.dart' as _i86;
import 'core/utils/shared_preferences_utils.dart' as _i9;
import 'features/admin/auth/data/data_source/remote_data_source/remote_data_source.dart'
    as _i36;
import 'features/admin/auth/data/repository/repository_impl.dart' as _i38;
import 'features/admin/auth/domain/repository/base_repository.dart' as _i37;
import 'features/admin/auth/domain/use_cases/log_in_use_case.dart' as _i39;
import 'features/admin/auth/domain/use_cases/sign_up_use_case.dart' as _i40;
import 'features/admin/auth/presentation/manager/log_in_cubit.dart' as _i61;
import 'features/admin/auth/presentation/manager/sign_up_cubit.dart' as _i67;
import 'features/admin/files/data/data_source/remote_data_source/remote_data_source.dart'
    as _i15;
import 'features/admin/files/data/repository/repository_impl.dart' as _i42;
import 'features/admin/files/domain/repository/base_repository.dart' as _i41;
import 'features/admin/files/domain/use_cases/change_file_number_use_case.dart'
    as _i43;
import 'features/admin/files/domain/use_cases/get_files_group_use_case.dart'
    as _i55;
import 'features/admin/files/domain/use_cases/get_files_system_use_case.dart'
    as _i56;
import 'features/admin/files/domain/use_cases/get_system_groups_use_case.dart'
    as _i59;
import 'features/admin/files/presentation/manager/change_file_number_cubit.dart'
    as _i73;
import 'features/admin/files/presentation/manager/files_cubit.dart' as _i81;
import 'features/admin/files/presentation/manager/system_groups_cubit.dart'
    as _i69;
import 'features/splash/manager/animation_splash_cubit.dart' as _i3;
import 'features/user/auth/log_in/data/data_source/remote_data_source/remote_data_source.dart'
    as _i22;
import 'features/user/auth/log_in/data/repository/repository_impl.dart' as _i24;
import 'features/user/auth/log_in/domain/repository/base_repository.dart'
    as _i23;
import 'features/user/auth/log_in/domain/use_cases/log_in_use_case.dart'
    as _i25;
import 'features/user/auth/log_in/presentation/manager/log_in_cubit.dart'
    as _i62;
import 'features/user/auth/sign_up/data/data_source/remote_data_source/remote_data_source.dart'
    as _i29;
import 'features/user/auth/sign_up/data/repository/repository_impl.dart'
    as _i31;
import 'features/user/auth/sign_up/domain/repository/base_repository.dart'
    as _i30;
import 'features/user/auth/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i32;
import 'features/user/auth/sign_up/presentation/manager/sign_up_cubit.dart'
    as _i68;
import 'features/user/auth/sign_up/presentation/screens/nav_bar/presentation/manager/cubit/selection_file_cubit.dart'
    as _i8;
import 'features/user/auth/sign_up/presentation/screens/nav_bar/presentation/manager/navigation_cubit.dart'
    as _i7;
import 'features/user/files/data/data_source/remote_data_source/remote_data_source.dart'
    as _i11;
import 'features/user/files/data/repository/repository_impl.dart' as _i13;
import 'features/user/files/domain/repository/base_repository.dart' as _i12;
import 'features/user/files/domain/use_case/add_file_use_case.dart' as _i34;
import 'features/user/files/domain/use_case/check_in_file_use_case.dart'
    as _i44;
import 'features/user/files/domain/use_case/check_out_file_use_case.dart'
    as _i45;
import 'features/user/files/domain/use_case/delete_file_use_case.dart' as _i48;
import 'features/user/files/domain/use_case/download_file_use_case.dart'
    as _i51;
import 'features/user/files/domain/use_case/file_state_use_case.dart' as _i14;
import 'features/user/files/domain/use_case/get_my_files_use_case.dart' as _i16;
import 'features/user/files/domain/use_case/history_file_use_case.dart' as _i21;
import 'features/user/files/domain/use_case/read_file_use_case.dart' as _i27;
import 'features/user/files/domain/use_case/save_file_use_case.dart' as _i28;
import 'features/user/files/presentation/manager/add_file_cubit.dart' as _i70;
import 'features/user/files/presentation/manager/cubit/download_file_cubit.dart'
    as _i79;
import 'features/user/files/presentation/manager/delete_file_cubit.dart'
    as _i75;
import 'features/user/files/presentation/manager/get_my_files_cubit.dart'
    as _i57;
import 'features/user/files/presentation/manager/get_state_file_cubit.dart'
    as _i17;
import 'features/user/files/presentation/manager/history_file_cubit.dart'
    as _i60;
import 'features/user/files/presentation/manager/read_file_cubit.dart' as _i64;
import 'features/user/files/presentation/manager/reserve_file_cubit.dart'
    as _i65;
import 'features/user/files/presentation/manager/save_file_cubit.dart' as _i66;
import 'features/user/group/data/data_source/remote_data_source/remote_data_source.dart'
    as _i18;
import 'features/user/group/data/repository/repository_impl.dart' as _i20;
import 'features/user/group/domain/repository/base_repository.dart' as _i19;
import 'features/user/group/domain/use_case/add_file_to_group_use_case.dart'
    as _i33;
import 'features/user/group/domain/use_case/add_user_to_group_use_case.dart'
    as _i35;
import 'features/user/group/domain/use_case/create_group_use_case.dart' as _i46;
import 'features/user/group/domain/use_case/delete_file_from_group_use_case.dart'
    as _i47;
import 'features/user/group/domain/use_case/delete_group_use_case.dart' as _i49;
import 'features/user/group/domain/use_case/delete_user_from_group_use_case.dart'
    as _i50;
import 'features/user/group/domain/use_case/get_all_file_check_in_group_use_case.dart'
    as _i52;
import 'features/user/group/domain/use_case/get_all_user_in_group_use_case.dart'
    as _i53;
import 'features/user/group/domain/use_case/get_my_group_use_case.dart' as _i58;
import 'features/user/group/domain/use_case/paginated_group_file_use_case.dart'
    as _i26;
import 'features/user/group/domain/use_case/users_system_use_case.dart' as _i54;
import 'features/user/group/presentation/manager/add_file_to_group_cubit.dart'
    as _i71;
import 'features/user/group/presentation/manager/add_user_to_group_cubit.dart'
    as _i72;
import 'features/user/group/presentation/manager/create_group_cubit.dart'
    as _i74;
import 'features/user/group/presentation/manager/cubit/get_just_my_group_cubit.dart'
    as _i84;
import 'features/user/group/presentation/manager/cubit/get_my_group_cubit.dart'
    as _i85;
import 'features/user/group/presentation/manager/delete_file_from_group_cubit.dart'
    as _i76;
import 'features/user/group/presentation/manager/delete_group_cubit.dart'
    as _i77;
import 'features/user/group/presentation/manager/delete_user_from_group_cubit.dart'
    as _i78;
import 'features/user/group/presentation/manager/get_all_file_check_in_group_cubit.dart'
    as _i80;
import 'features/user/group/presentation/manager/get_all_user_in_group_cubit.dart'
    as _i82;
import 'features/user/group/presentation/manager/get_all_user_system_cubit.dart'
    as _i83;
import 'features/user/group/presentation/manager/paginated_group_file_cubit.dart'
    as _i63;

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
    gh.factory<_i3.AnimationSplashCubit>(() => _i3.AnimationSplashCubit());
    gh.singleton<_i4.Dio>(thirdPartyInjection.dio);
    gh.singleton<_i5.ErrorInterceptor>(_i5.ErrorInterceptor());
    gh.singleton<_i6.LoggingInterceptor>(_i6.LoggingInterceptor());
    gh.factory<_i7.NavigationCubit>(() => _i7.NavigationCubit());
    gh.factory<_i8.SelectionFileCubit>(() => _i8.SelectionFileCubit());
    gh.singleton<_i9.SharedPreferencesUtils>(_i9.SharedPreferencesUtils());
    gh.singleton<_i10.ApiConsumer>(_i5.DioConsumer(gh<_i4.Dio>()));
    gh.singleton<_i11.FileBaseRemoteDataSource>(
        _i11.FileRemoteDataSource(gh<_i10.ApiConsumer>()));
    gh.singleton<_i12.FileBaseRepository>(
        _i13.FileRepositoryImpl(gh<_i11.FileBaseRemoteDataSource>()));
    gh.singleton<_i14.FileStateUseCase>(
        _i14.FileStateUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i15.GetAllFilesSystemBaseRemoteDataSource>(
        _i15.GetAllGroupsSystemRemoteDataSource(gh<_i10.ApiConsumer>()));
    gh.singleton<_i16.GetMyFilesUseCase>(
        _i16.GetMyFilesUseCase(gh<_i12.FileBaseRepository>()));
    gh.factory<_i17.GetStateFileCubit>(
        () => _i17.GetStateFileCubit(gh<_i14.FileStateUseCase>()));
    gh.singleton<_i18.GroupBaseRemoteDataSource>(
        _i18.GroupRemoteDataSource(gh<_i10.ApiConsumer>()));
    gh.singleton<_i19.GroupBaseRepository>(
        _i20.GroupRepositoryImpl(gh<_i18.GroupBaseRemoteDataSource>()));
    gh.singleton<_i21.HistoryFileUseCase>(
        _i21.HistoryFileUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i22.LogInBaseRemoteDataSource>(
        _i22.LogInRemoteDataSourceImpl(gh<_i10.ApiConsumer>()));
    gh.singleton<_i23.LogInBaseRepository>(
        _i24.LogInRepositoryImpl(gh<_i22.LogInBaseRemoteDataSource>()));
    gh.singleton<_i25.LogInUseCase>(
        _i25.LogInUseCase(gh<_i23.LogInBaseRepository>()));
    gh.singleton<_i26.PaginatedGroupFileUseCase>(
        _i26.PaginatedGroupFileUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i27.ReadFileUseCase>(
        _i27.ReadFileUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i28.SaveFileUseCase>(
        _i28.SaveFileUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i29.SignUpBaseRemoteDataSource>(
        _i29.SignUpRemoteDataSourceImpl(gh<_i10.ApiConsumer>()));
    gh.singleton<_i30.SignUpBaseRepository>(
        _i31.SignUpRepositoryImpl(gh<_i29.SignUpBaseRemoteDataSource>()));
    gh.singleton<_i32.SignUpUseCase>(
        _i32.SignUpUseCase(gh<_i30.SignUpBaseRepository>()));
    gh.singleton<_i33.AddFileToGroupUseCase>(
        _i33.AddFileToGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i34.AddFileUseCase>(
        _i34.AddFileUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i35.AddUserToGroupUseCase>(
        _i35.AddUserToGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i36.AdminAuthBaseRemoteDataSource>(
        _i36.AdminAuthRemoteDataSourceImpl(gh<_i10.ApiConsumer>()));
    gh.singleton<_i37.AdminAuthBaseRepository>(
        _i38.AdminAuthRepositoryImpl(gh<_i36.AdminAuthBaseRemoteDataSource>()));
    gh.singleton<_i39.AdminLogInUseCase>(
        _i39.AdminLogInUseCase(gh<_i37.AdminAuthBaseRepository>()));
    gh.singleton<_i40.AdminSignUpUseCase>(
        _i40.AdminSignUpUseCase(gh<_i37.AdminAuthBaseRepository>()));
    gh.singleton<_i41.AdminSystemBaseRepository>(_i42.AdminSystemRepositoryImpl(
        gh<_i15.GetAllFilesSystemBaseRemoteDataSource>()));
    gh.singleton<_i43.ChangeFileNumberUseCase>(
        _i43.ChangeFileNumberUseCase(gh<_i41.AdminSystemBaseRepository>()));
    gh.singleton<_i44.CheckInFileUseCase>(
        _i44.CheckInFileUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i45.CheckOutFileUseCase>(
        _i45.CheckOutFileUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i46.CreateGroupUseCase>(
        _i46.CreateGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i47.DeleteFileFromGroupUseCase>(
        _i47.DeleteFileFromGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i48.DeleteFileUseCase>(
        _i48.DeleteFileUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i49.DeleteGroupUseCase>(
        _i49.DeleteGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i50.DeleteUserFromGroupUseCase>(
        _i50.DeleteUserFromGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i51.DownloadFileUseCase>(
        _i51.DownloadFileUseCase(gh<_i12.FileBaseRepository>()));
    gh.singleton<_i52.GetAllFilesCheckInGroupUseCase>(
        _i52.GetAllFilesCheckInGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i53.GetAllUserInGroupUseCase>(
        _i53.GetAllUserInGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i54.GetAllUsersInSystemUseCase>(
        _i54.GetAllUsersInSystemUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i55.GetFilesGroupUseCase>(
        _i55.GetFilesGroupUseCase(gh<_i41.AdminSystemBaseRepository>()));
    gh.singleton<_i56.GetFilesSystemUseCase>(
        _i56.GetFilesSystemUseCase(gh<_i41.AdminSystemBaseRepository>()));
    gh.factory<_i57.GetMyFilesCubit>(
        () => _i57.GetMyFilesCubit(gh<_i16.GetMyFilesUseCase>()));
    gh.singleton<_i58.GetMyGroupUseCase>(
        _i58.GetMyGroupUseCase(gh<_i19.GroupBaseRepository>()));
    gh.singleton<_i59.GetSystemGroupsUseCase>(
        _i59.GetSystemGroupsUseCase(gh<_i41.AdminSystemBaseRepository>()));
    gh.factory<_i60.HistoryFileCubit>(
        () => _i60.HistoryFileCubit(gh<_i21.HistoryFileUseCase>()));
    gh.factory<_i61.LogInAdminCubit>(() => _i61.LogInAdminCubit(
          gh<_i39.AdminLogInUseCase>(),
          gh<_i9.SharedPreferencesUtils>(),
        ));
    gh.factory<_i62.LogInCubit>(() => _i62.LogInCubit(
          gh<_i25.LogInUseCase>(),
          gh<_i9.SharedPreferencesUtils>(),
        ));
    gh.factory<_i63.PaginatedGroupFileCubit>(() =>
        _i63.PaginatedGroupFileCubit(gh<_i26.PaginatedGroupFileUseCase>()));
    gh.factory<_i64.ReadFileCubit>(
        () => _i64.ReadFileCubit(gh<_i27.ReadFileUseCase>()));
    gh.factory<_i65.ReserveFileCubit>(() => _i65.ReserveFileCubit(
          gh<_i44.CheckInFileUseCase>(),
          gh<_i45.CheckOutFileUseCase>(),
        ));
    gh.factory<_i66.SaveFileCubit>(
        () => _i66.SaveFileCubit(gh<_i28.SaveFileUseCase>()));
    gh.factory<_i67.SignUpAdminCubit>(
        () => _i67.SignUpAdminCubit(gh<_i40.AdminSignUpUseCase>()));
    gh.factory<_i68.SignUpCubit>(
        () => _i68.SignUpCubit(gh<_i32.SignUpUseCase>()));
    gh.factory<_i69.SystemGroupsCubit>(
        () => _i69.SystemGroupsCubit(gh<_i59.GetSystemGroupsUseCase>()));
    gh.factory<_i70.AddFileCubit>(
        () => _i70.AddFileCubit(gh<_i34.AddFileUseCase>()));
    gh.factory<_i71.AddFileToGroupCubit>(
        () => _i71.AddFileToGroupCubit(gh<_i33.AddFileToGroupUseCase>()));
    gh.factory<_i72.AddUserToGroupCubit>(
        () => _i72.AddUserToGroupCubit(gh<_i35.AddUserToGroupUseCase>()));
    gh.factory<_i73.ChangeFileNumberCubit>(
        () => _i73.ChangeFileNumberCubit(gh<_i43.ChangeFileNumberUseCase>()));
    gh.factory<_i74.CreateGroupCubit>(
        () => _i74.CreateGroupCubit(gh<_i46.CreateGroupUseCase>()));
    gh.factory<_i75.DeleteFileCubit>(
        () => _i75.DeleteFileCubit(gh<_i48.DeleteFileUseCase>()));
    gh.factory<_i76.DeleteFileFromGroupCubit>(() =>
        _i76.DeleteFileFromGroupCubit(gh<_i47.DeleteFileFromGroupUseCase>()));
    gh.factory<_i77.DeleteGroupCubit>(
        () => _i77.DeleteGroupCubit(gh<_i49.DeleteGroupUseCase>()));
    gh.factory<_i78.DeleteUserFromGroupCubit>(() =>
        _i78.DeleteUserFromGroupCubit(gh<_i50.DeleteUserFromGroupUseCase>()));
    gh.factory<_i79.DownloadFileCubit>(
        () => _i79.DownloadFileCubit(gh<_i51.DownloadFileUseCase>()));
    gh.factory<_i80.GetAllFileCheckInGroupCubit>(() =>
        _i80.GetAllFileCheckInGroupCubit(
            gh<_i52.GetAllFilesCheckInGroupUseCase>()));
    gh.factory<_i81.GetAllFilesSystemCubit>(() => _i81.GetAllFilesSystemCubit(
          gh<_i56.GetFilesSystemUseCase>(),
          gh<_i55.GetFilesGroupUseCase>(),
        ));
    gh.factory<_i82.GetAllUserInGroupCubit>(
        () => _i82.GetAllUserInGroupCubit(gh<_i53.GetAllUserInGroupUseCase>()));
    gh.factory<_i83.GetAllUserSystemCubit>(() =>
        _i83.GetAllUserSystemCubit(gh<_i54.GetAllUsersInSystemUseCase>()));
    gh.factory<_i84.GetJustMyGroupCubit>(
        () => _i84.GetJustMyGroupCubit(gh<_i58.GetMyGroupUseCase>()));
    gh.factory<_i85.GetMyGroupCubit>(
        () => _i85.GetMyGroupCubit(gh<_i58.GetMyGroupUseCase>()));
    return this;
  }
}

class _$ThirdPartyInjection extends _i86.ThirdPartyInjection {}
