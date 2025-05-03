import 'package:eschool_management/core/constants/app_assets.dart';
import 'package:eschool_management/core/utils/local/local_service.dart';
import 'package:eschool_management/features/presentation/widgets/auth/widgets_imports.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/helper_functions.dart';

class ChooseUserType extends StatelessWidget {
  const ChooseUserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: HelperFunctions.screenHeight(context) * .6,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: HeaderAuth(
                title: AppLocalization.of(context)!
                    .translate("chooseUserTypeTitle"),
                subtitle: AppLocalization.of(context)!
                    .translate("chooseUserTypeSubtitle"),
                imageHeader: AppAssets.value,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 40, left: 15, right: 15),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ButtonUserType(
                    textButton: 'Continue as Student',
                    iconUserTypeWhite: AppAssets.student,
                    iconUserTypeBlack: AppAssets.student,
                    buttonColor: AppColors.primaryColor,
                    onNavigate: () => Navigator.pushNamed(
                        context, AppRoutes.chooseStudentClassroom,
                        arguments: "student"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 2,
                          endIndent: 2,
                          color: AppColors.textGrey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppLocalization.of(context)!.translate("orContinueAs"),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          indent: 2,
                          endIndent: 2,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonUserType(
                    textButton: 'Continue as Teacher',
                    iconUserTypeWhite: AppAssets.teacher,
                    iconUserTypeBlack: AppAssets.teacherBlack,
                    isShowBorder: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonUserType(
                    textButton: 'Continue as Parent',
                    iconUserTypeWhite: AppAssets.parent,
                    iconUserTypeBlack: AppAssets.parentBlack,
                    isShowBorder: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
