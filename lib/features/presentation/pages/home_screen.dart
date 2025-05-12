import 'package:eschool_management/core/constants/app_colors.dart';
import 'package:eschool_management/features/presentation/widgets/home/widgets_imports.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: HelperFunctions.screenHeight(context) * .05,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: HeaderHome(),
            ),
            backgroundColor: HelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.white,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 30, left: 15, right: 15),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [PersonalInfoUser()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
