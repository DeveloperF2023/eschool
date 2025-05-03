import 'package:dio/dio.dart';
import 'package:eschool_management/features/domain/use_cases/classroom/fetch_classroom_by_school_id_use_case.dart';
import 'package:eschool_management/features/domain/use_cases/schools/get_schools_use_case.dart';
import 'package:eschool_management/features/presentation/manager/classroom/get_classroom/get_classroom_cubit.dart';
import 'package:eschool_management/features/presentation/manager/schools/get_school/get_school_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/request_code/request_code_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/data/data_sources/remote_data_source.dart';
import 'features/data/data_sources/remote_data_source_impl.dart';
import 'features/data/repositories/repository_impl.dart';
import 'features/domain/repositories/repository.dart';
import 'features/domain/use_cases/user/request_code_use_case.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory(() => GetSchoolCubit(
        getSchoolsUseCase: locator.call(),
      ));
  locator.registerFactory(() => GetClassroomCubit(
        fetchClassroomBySchoolIdUseCase: locator.call(),
      ));
  locator.registerFactory(() => RequestCodeCubit(
        requestCodeUseCase: locator.call(),
      ));

  ///Use Case
  locator.registerLazySingleton(
      () => FetchSchoolsUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchClassroomBySchoolIdUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => RequestCodeUseCase(repository: locator.call()));

  ///Repository
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(remoteDataSource: locator.call()),
  );

  ///Data Source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator.call(),
    ),
  );

  locator.registerLazySingleton<RemoteDataSourceImpl>(
    () => RemoteDataSourceImpl(
      client: locator.call(),
    ),
  );

  ///External
  locator.registerLazySingleton(() => Dio());
}
