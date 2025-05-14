import 'package:dio/dio.dart';
import 'package:eschool_management/features/domain/use_cases/classroom/fetch_classroom_by_school_id_use_case.dart';
import 'package:eschool_management/features/domain/use_cases/events/fetch_events_use_case.dart';
import 'package:eschool_management/features/domain/use_cases/schools/get_schools_use_case.dart';
import 'package:eschool_management/features/domain/use_cases/timetable/fetch_today_classes_use_case.dart';
import 'package:eschool_management/features/domain/use_cases/user/fetch_user_info_use_case.dart';
import 'package:eschool_management/features/domain/use_cases/user/get_current_token_use_case.dart';
import 'package:eschool_management/features/domain/use_cases/user/is_sign_in_use_case.dart';
import 'package:eschool_management/features/presentation/manager/classroom/get_classroom/get_classroom_cubit.dart';
import 'package:eschool_management/features/presentation/manager/events/get_events/get_events_cubit.dart';
import 'package:eschool_management/features/presentation/manager/homeworks/today_and_next_week_homework/today_and_next_week_homework_cubit.dart';
import 'package:eschool_management/features/presentation/manager/schools/get_school/get_school_cubit.dart';
import 'package:eschool_management/features/presentation/manager/timetable/today_classes/get_today_classes_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/auth/auth_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/login_user/login_user_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/personal_user_info/personal_user_info_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/request_code/request_code_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/data/data_sources/remote_data_source.dart';
import 'features/data/data_sources/remote_data_source_impl.dart';
import 'features/data/repositories/repository_impl.dart';
import 'features/domain/repositories/repository.dart';
import 'features/domain/use_cases/exams/fetch_today_next_week_exam_use_case.dart';
import 'features/domain/use_cases/homeworks/fetch_today_and_next_week_homeworks_use_case.dart';
import 'features/domain/use_cases/user/login_user_use_case.dart';
import 'features/domain/use_cases/user/request_code_use_case.dart';
import 'features/presentation/manager/exams/get_today_next_week_exam/get_today_next_week_exam_cubit.dart';

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
  locator.registerFactory(() => LoginUserCubit(
        loginUserUseCase: locator.call(),
      ));
  locator.registerFactory(() => PersonalUserInfoCubit(
        fetchUserInfoUseCase: locator.call(),
      ));
  locator.registerFactory(() => AuthCubit(
        getCurrentTokenUserUseCase: locator.call(),
        isSignInUserUseCase: locator.call(),
      ));
  locator.registerFactory(() => GetTodayClassesCubit(
        fetchTodayClassesUseCase: locator.call(),
      ));
  locator.registerFactory(() => GetEventsCubit(
        fetchEventsUseCase: locator.call(),
      ));
  locator.registerFactory(() => GetTodayNextWeekExamCubit(
        fetchTodayAndNextWeekExamsUseCase: locator.call(),
      ));
  locator.registerFactory(() => TodayAndNextWeekHomeworkCubit(
        fetchTodayAndNextWeekHomeworkUseCase: locator.call(),
      ));

  ///Use Case
  locator.registerLazySingleton(
      () => FetchSchoolsUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchClassroomBySchoolIdUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => RequestCodeUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => LoginUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchUserInfoUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => GetCurrentTokenUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => IsSignInUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchTodayClassesUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchEventsUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchTodayAndNextWeekExamUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchTodayAndNextWeekHomeworkUseCase(repository: locator.call()));

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
