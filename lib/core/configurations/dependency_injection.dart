import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prayer_app/core/helper/api_helper/api_helper.dart';
import 'package:prayer_app/core/helper/location/location_helper.dart';
import 'package:prayer_app/core/helper/permission/permission_helper.dart';
import 'package:prayer_app/features/details_app/data/datasources/local_data_source/details_app_local.dart';
import 'package:prayer_app/features/details_app/data/datasources/remote_data_source/details_app_remote_data_source.dart';
import 'package:prayer_app/features/details_app/data/repositories/details_app_repo_impl.dart';
import 'package:prayer_app/features/details_app/presentation/cubit/details_app_cubit.dart';

final sl = GetIt.instance;

Future<void> setUpLocators() async {
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
  sl.registerLazySingleton(() => DetailsAppCubit(sl(), sl(), sl()));

}
