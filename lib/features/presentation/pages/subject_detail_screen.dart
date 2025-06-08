import 'package:eschool_management/core/api/endpoints_constants.dart';
import 'package:eschool_management/core/constants/app_colors.dart';
import 'package:eschool_management/core/utils/helper_functions.dart';
import 'package:eschool_management/core/utils/local/local_service.dart';
import 'package:eschool_management/dependencies_injection.dart';
import 'package:eschool_management/features/presentation/manager/subjects/subject_weekly_hours/subject_weekly_hours_cubit.dart';
import 'package:eschool_management/features/presentation/widgets/global/widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/timetable/timetable_by_day_entity.dart';
import '../widgets/subjects/widgets_imports.dart';

class SubjectDetailScreen extends StatefulWidget {
  final TimetableByDayEntity timetable;

  const SubjectDetailScreen({super.key, required this.timetable});

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .06,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: HeaderApp(title: widget.timetable.subjectName!),
              ),
              backgroundColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          "${EndpointsConstants.imageUrl}${widget.timetable.teacherPicture}",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.timetable.teacherName!,
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      // You can show different content based on selectedFilter here
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Room: ${widget.timetable.roomNumber.toString()}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(width: 5),
                          Container(
                            height: 15,
                            width: 1,
                            color: AppColors.grey,
                          ),
                          SizedBox(width: 5),
                          BlocProvider(
                            create:
                                (context) =>
                                    locator<SubjectWeeklyHoursCubit>()
                                      ..getHomeworkBySubject(
                                        subjectId: widget.timetable.subjectId!,
                                      ),
                            child: BlocBuilder<
                              SubjectWeeklyHoursCubit,
                              SubjectWeeklyHoursState
                            >(
                              builder: (context, state) {
                                print("State of weekly hours: $state");
                                if (state is SubjectWeeklyHoursLoading) {
                                  return Container();
                                } else if (state is SubjectWeeklyHoursLoaded) {
                                  return Text(
                                    "${state.subjectWeeklyHours.hoursPerWeek} h/ week",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  );
                                } else if (state is SubjectWeeklyHoursFailure) {
                                  return Text(
                                    "Error loading hours",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  );
                                }
                                return Container();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,

                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                decoration: BoxDecoration(
                  color:
                      HelperFunctions.isDarkMode(context)
                          ? AppColors.darkerGrey
                          : AppColors.light,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  isScrollable: false,
                  labelPadding: const EdgeInsets.only(left: 5, right: 5),
                  indicator: BoxDecoration(
                    color:
                        HelperFunctions.isDarkMode(context)
                            ? AppColors.dark
                            : AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  unselectedLabelColor: Colors.black54,
                  labelColor:
                      HelperFunctions.isDarkMode(context)
                          ? AppColors.white
                          : AppColors.black,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12),
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  tabs: [
                    Tab(
                      text: AppLocalization.of(
                        context,
                      )!.translate("homeworkBySubjectTitle"),
                    ),
                    Tab(
                      text: AppLocalization.of(
                        context,
                      )!.translate("Today's resources"),
                    ),
                    Tab(text: AppLocalization.of(context)!.translate("notes")),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: TabBarView(
                  children: [
                    HomeworkBySubject(subjectId: widget.timetable.subjectId!),
                    ResourceBySubject(subjectId: widget.timetable.subjectId!),
                    TeacherNoteBySubject(
                      subjectId: widget.timetable.subjectId!,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
