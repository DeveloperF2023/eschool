import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/local/local_service.dart';
import '../../../../dependencies_injection.dart';
import '../../manager/classroom/get_classroom/get_classroom_cubit.dart';
import '../../manager/schools/get_school/get_school_cubit.dart';
import '../../widgets/auth/widgets_imports.dart';
import '../../widgets/global/widgets_imports.dart';

class ChooseParentClassroomScreen extends StatefulWidget {
  final String userType;
  const ChooseParentClassroomScreen({super.key, required this.userType});

  @override
  State<ChooseParentClassroomScreen> createState() =>
      _ChooseParentClassroomScreenState();
}

class _ChooseParentClassroomScreenState
    extends State<ChooseParentClassroomScreen> {
  int? selectedSchoolId;
  int? selectedClassroomId;
  bool isDropdownOpen = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetSchoolCubit>(
          create: (context) => locator<GetSchoolCubit>()..getSchools(),
        ),
        BlocProvider<GetClassroomCubit>(
          create: (context) => locator<GetClassroomCubit>()
            ..getClassroomBySchoolId(schoolId: 11),
        ),
      ],
      child: Scaffold(
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
                      .translate("chooseParentClassroomTitle"),
                  subtitle: AppLocalization.of(context)!
                      .translate("chooseParentClassroomSubtitle"),
                  imageHeader: AppAssets.parentClassroom,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      AppLocalization.of(context)!.translate("yourClassParent"),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalization.of(context)!
                          .translate("classDescriptionParent"),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomSchoolDropdown(
                      onChanged: (newSchoolId) {
                        setState(() {
                          selectedSchoolId = newSchoolId;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomClassroomDropdown(
                      selectedSchoolId: selectedSchoolId ?? 11,
                      onChanged: (newClassroomId) {
                        setState(() {
                          selectedClassroomId = newClassroomId;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                      onNavigate: () {
                        print("user Type: ${widget.userType}");
                        print("classroom Id: $selectedClassroomId");
                        Navigator.pushNamed(context, AppRoutes.enterEmail,
                            arguments: {
                              "userType": widget.userType,
                              "classroomId": selectedClassroomId
                            });
                      },
                      textButton: "Continue",
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
