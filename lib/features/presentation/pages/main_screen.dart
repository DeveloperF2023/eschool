import 'package:eschool_management/core/utils/helper_functions.dart';
import 'package:eschool_management/features/presentation/pages/event_screen.dart';
import 'package:eschool_management/features/presentation/pages/exam_screen.dart';
import 'package:eschool_management/features/presentation/pages/profile_screen.dart';
import 'package:eschool_management/features/presentation/pages/timetable_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/local/local_service.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  final String? token;
  final Function(String)? onLocaleChange;
  const MainScreen({super.key, this.token, this.onLocaleChange});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem buildBottomNavItem(
      String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: _selectedIndex == index
          ? Iconify(
              icon,
            )
          : Iconify(
              icon,
            ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            const HomeScreen(),
            const ExamScreen(),
            const EventScreen(),
            const TimetableScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          buildBottomNavItem(Ri.home_3_line,
              AppLocalization.of(context)!.translate("home"), 0),
          buildBottomNavItem(
              Ph.exam, AppLocalization.of(context)!.translate("exams"), 1),
          buildBottomNavItem(MaterialSymbols.event_note_outline_rounded,
              AppLocalization.of(context)!.translate("events"), 2),
          buildBottomNavItem(Mdi.clock_time_twelve_outline,
              AppLocalization.of(context)!.translate("timeTable"), 3),
          buildBottomNavItem(Carbon.user_avatar,
              AppLocalization.of(context)!.translate("profile"), 4),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        backgroundColor: HelperFunctions.isDarkMode(context)
            ? AppColors.dark
            : AppColors.light,
      ),
    );
  }
}
