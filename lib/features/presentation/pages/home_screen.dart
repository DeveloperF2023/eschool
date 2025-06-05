import 'package:eschool_management/core/constants/app_colors.dart';
import 'package:eschool_management/core/utils/local/local_service.dart';
import 'package:eschool_management/features/presentation/widgets/global/widgets_imports.dart';
import 'package:eschool_management/features/presentation/widgets/home/widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';

import '../../../core/utils/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: HelperFunctions.screenHeight(context) * .06,
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
            padding: EdgeInsets.only(top: 30, bottom: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: AppLocalization.of(context)!
                                    .translate("SearchHere"),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 25,
                                  color: HelperFunctions.isDarkMode(context)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                contentPadding: EdgeInsets.only(bottom: 5),
                                hintStyle:
                                    Theme.of(context).textTheme.titleLarge),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          AppLocalization.of(context)!.translate("discover"),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DiscoverItem(
                              icon: Ri.user_follow_fill,
                              discoverText: AppLocalization.of(context)!
                                  .translate("attendance"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DiscoverItem(
                              icon: Ph.books_duotone,
                              discoverText: AppLocalization.of(context)!
                                  .translate("books"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DiscoverItem(
                              icon: Ph.exam_fill,
                              discoverText: AppLocalization.of(context)!
                                  .translate("exams"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DiscoverItem(
                              icon: Ph.chalkboard_teacher_fill,
                              discoverText: AppLocalization.of(context)!
                                  .translate("subjects"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DiscoverItem(
                              icon: Ic.baseline_playlist_add_check,
                              discoverText: AppLocalization.of(context)!
                                  .translate("resultOfExams"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      AppLocalization.of(context)!.translate("todayClasses"),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TodayClassesItem(),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      AppLocalization.of(context)!.translate("events"),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  EventItem(),
                  SizedBox(
                    height: 20,
                  ),
                  ExamItem(),
                  SizedBox(
                    height: 20,
                  ),
                  HeadlineSection(
                      headline:
                          AppLocalization.of(context)!.translate("homework")),
                  HomeworkItem(),
                  SizedBox(
                    height: 20,
                  ),
                  HeadlineSection(
                      headline:
                          AppLocalization.of(context)!.translate("attendance")),
                  AttendanceItem(),
                  SizedBox(
                    height: 20,
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
