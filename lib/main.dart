import 'package:eschool_management/features/presentation/manager/user/login_user/login_user_cubit.dart';
import 'package:eschool_management/features/presentation/manager/user/request_code/request_code_cubit.dart';
import 'package:eschool_management/features/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routes/on_general_routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/local/local_service.dart';
import 'dependencies_injection.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<RequestCodeCubit>()),
        BlocProvider(create: (_) => locator<LoginUserCubit>()),
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
          "/": (context) => SplashScreen(),
        },
      ),
    );
  }
}
