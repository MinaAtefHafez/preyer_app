import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prayer_app/core/helper/api_helper/api_helper.dart';
import 'package:prayer_app/core/helper/location/location_helper.dart';
import 'package:prayer_app/core/helper/permission/permission_helper.dart';
import 'package:prayer_app/features/details_app/data/datasources/local_data_source/details_app_local.dart';
import 'package:prayer_app/features/details_app/data/datasources/remote_data_source/details_app_remote_data_source.dart';
import 'package:prayer_app/features/details_app/data/repositories/details_app_repo_impl.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';
import 'package:prayer_app/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:prayer_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:prayer_app/features/home/data/repository/home_repo.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> setUpLocator() async {
  //! helpers
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiHelper>(() => DioHelper(sl()));
  sl.registerLazySingleton(() => PermissionHelper());
  sl.registerLazySingleton(() => LocationHelper());

  //! Details App
  sl.registerLazySingleton<DetailsAppRepo>(
      () => DetailsAppRepoImpl(sl(), sl()));
  sl.registerLazySingleton<DetailsAppRemoteDataSource>(
      () => DetailsAppRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<DetailsAppLocalDataSource>(
      () => DetailsAppLocalDataSourceImpl());
  sl.registerLazySingleton(
      () => DetailsAppCubit(sl(), sl(), sl())..callLocals());

  //! Home

  //! prayers

  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl(), sl()));
  sl.registerLazySingleton(() => HomeCubit(sl(), sl(), sl())..getMonthLocal());
}
