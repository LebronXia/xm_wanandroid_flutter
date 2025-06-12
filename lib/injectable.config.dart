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

import 'app/bloc/search_cubit.dart' as _i87;
import 'data/repository/auth_repository.dart' as _i691;
import 'data/repository/search_repository.dart' as _i752;
import 'data/repository/search_repository_impl.dart' as _i153;
import 'data/wan_android_api.dart' as _i350;
import 'http/dio_config.dart' as _i144;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
  gh.singleton<_i350.WanAndroidApi>(
    () => dioModule.wanAndroidApi(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i752.SearchRepository>(() => _i153.SearchRepositoryImpl());
  gh.factory<_i691.AuthRepository>(
    () => _i691.AuthRepository(gh<_i350.WanAndroidApi>()),
  );
  gh.factory<_i87.SearchCubit>(
    () => _i87.SearchCubit(gh<_i752.SearchRepository>()),
  );
  return getIt;
}

class _$DioModule extends _i144.DioModule {}
