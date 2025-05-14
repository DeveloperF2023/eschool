import 'package:dio/dio.dart';
import 'package:eschool_management/features/presentation/manager/events/get_events/get_events_cubit.dart';
import 'package:eschool_management/features/presentation/manager/exams/get_today_next_week_exam/get_today_next_week_exam_cubit.dart';
import 'package:eschool_management/features/presentation/manager/timetable/today_classes/get_today_classes_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/login_user/login_user_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/personal_user_info/personal_user_info_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/request_code/request_code_cubit.dart';
import 'package:eschool_management/features/presentation/pages/auth/login_screen.dart';
import 'package:eschool_management/features/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/on_general_routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/local/local_service.dart';
import 'dependencies_injection.dart';
import 'features/data/data_sources/remote_data_source.dart';
import 'features/data/data_sources/remote_data_source_impl.dart';
import 'features/presentation/manager/homeworks/today_and_next_week_homework/today_and_next_week_homework_cubit.dart';
import 'features/presentation/manager/user/auth/auth_cubit.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Dio client = Dio();
  RemoteDataSource remoteDataSource = RemoteDataSourceImpl(client: client);
  print(remoteDataSource.getTodayAndNextWeekHomeworks());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final Locale? locale;
  const MyApp({super.key, this.locale});
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Sets the locale for the app
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Locale _locale = const Locale("en");
  void _changeLanguageForSetting(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', locale); // Save language code
    setState(() {
      _locale = Locale(locale); // Update locale
    });
    MyApp.setLocale(context, Locale(locale));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => locator<RequestCodeCubit>()),
        BlocProvider(create: (_) => locator<LoginUserCubit>()),
        BlocProvider(create: (_) => locator<PersonalUserInfoCubit>()),
        BlocProvider(create: (_) => locator<GetTodayClassesCubit>()),
        BlocProvider(create: (_) => locator<GetEventsCubit>()),
        BlocProvider(create: (_) => locator<GetTodayNextWeekExamCubit>()),
        BlocProvider(create: (_) => locator<TodayAndNextWeekHomeworkCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkTheme,
        locale: _locale,
        supportedLocales: const [
          Locale('en', ''),
          Locale('fr', ''),
          Locale('ar', ''),
        ],
        localizationsDelegates: [
          AppLocalizationsDelegate(_locale),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        initialRoute: "/",
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) => BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is Authenticated) {
                    return MainScreen(
                      token: authState.token,
                      onLocaleChange: _changeLanguageForSetting,
                    );
                  } else {
                    return LoginScreen();
                  }
                },
              ),
        },
      ),
    );
  }
}
