import 'package:eschool_management/features/presentation/pages/auth/choose_student_classroom.dart';
import 'package:eschool_management/features/presentation/pages/auth/choose_user_type.dart';
import 'package:eschool_management/features/presentation/pages/auth/enter_mail_screen.dart';
import 'package:eschool_management/features/presentation/pages/auth/login_screen.dart';
import 'package:eschool_management/features/presentation/pages/home_screen.dart';
import 'package:eschool_management/features/presentation/pages/splash_screen.dart';
import 'package:eschool_management/features/presentation/pages/success/success_login_screen.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/pages/auth/choose_parent_classroom_screen.dart';
import 'app_routes.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.enterEmail:
        {
          if (args is Map<String, dynamic>) {
            return routeBuilder(
              EnterEmailScreen(
                userType: args['userType'],
                classroomId: args['classroomId'],
              ),
            );
          }
        }
      case AppRoutes.splash:
        {
          return routeBuilder(const SplashScreen());
        }
      case AppRoutes.chooseUserType:
        {
          return routeBuilder(const ChooseUserType());
        }
      case AppRoutes.chooseStudentClassroom:
        {
          if (args is String) {
            return routeBuilder(ChooseStudentClassroom(userType: args));
          }
        }
      case AppRoutes.chooseParentClassroom:
        {
          if (args is String) {
            return routeBuilder(ChooseParentClassroomScreen(userType: args));
          }
        }
      case AppRoutes.successLogin:
        {
          return routeBuilder(const SuccessLoginScreen());
        }
      case AppRoutes.login:
        {
          return routeBuilder(const LoginScreen());
        }
      case AppRoutes.home:
        {
          return routeBuilder(const HomeScreen());
        }
    }
  }
}

dynamic routeBuilder(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page not found")),
      body: const Center(child: Text("Page not found")),
    );
  }
}
