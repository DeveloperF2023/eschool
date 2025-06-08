import 'package:eschool_management/core/constants/app_assets.dart';
import 'package:eschool_management/features/presentation/manager/exams/get_exams_by_day/get_exams_by_day_cubit.dart';
import 'package:eschool_management/features/presentation/manager/homeworks/my_homeworks_by_day/my_homeworks_by_day_cubit.dart';
import 'package:eschool_management/features/presentation/widgets/global/widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/local/local_service.dart';
import '../manager/timetable/get_timetable_by_day/get_timetable_by_day_cubit.dart';
import '../widgets/timetable/widgets_imports.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  DateTime? selectedDate;
  String? selectedDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    selectedDate = now;
    selectedDay = DateFormat('EEEE').format(now);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetTimetableByDayCubit>().getTimetableByDay(
        day: selectedDay!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> getCurrentWeekFromMondayToSaturday() {
      final today = DateTime.now();
      final currentWeekday = today.weekday; // 1 = Monday, ..., 7 = Sunday
      final monday = today.subtract(Duration(days: currentWeekday - 1));
      return List.generate(6, (index) => monday.add(Duration(days: index)));
    }

    final weekDays = getCurrentWeekFromMondayToSaturday();
    final now = DateTime.now();
    final dayNumber = selectedDate?.day ?? now.day;
    final dayName = DateFormat('E').format(selectedDate ?? now);
    final month = DateFormat('MMM').format(selectedDate ?? now);
    final year = (selectedDate ?? now).year;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: HelperFunctions.screenHeight(context) * .03,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: HeaderApp(
                title: AppLocalization.of(context)!.translate("timeTable"),
              ),
            ),
            backgroundColor:
                HelperFunctions.isDarkMode(context)
                    ? AppColors.dark
                    : AppColors.white,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 5, bottom: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color:
                        HelperFunctions.isDarkMode(context)
                            ? AppColors.darkContainer
                            : AppColors.softGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            dayNumber.toString(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dayName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  Text(
                                    month,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    year.toString(),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 35),
                      if (selectedDate != null &&
                          selectedDate!.day == now.day &&
                          selectedDate!.month == now.month &&
                          selectedDate!.year == now.year)
                        Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "Today",
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weekDays.length,
                    itemBuilder: (_, index) {
                      final date = weekDays[index];
                      final dayNameShort = DateFormat('EEE').format(date);
                      final dayNumber = date.day.toString();
                      final isSelected =
                          selectedDate != null &&
                          selectedDate!.day == date.day &&
                          selectedDate!.month == date.month &&
                          selectedDate!.year == date.year;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = date;
                            selectedDay = DateFormat('EEEE').format(date);
                          });
                          context
                              .read<GetTimetableByDayCubit>()
                              .getTimetableByDay(day: selectedDay!);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayNameShort.toUpperCase(),
                                style: Theme.of(
                                  context,
                                ).textTheme.titleSmall!.copyWith(
                                  color:
                                      isSelected
                                          ? AppColors.white
                                          : AppColors.textGrey,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                dayNumber,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  color:
                                      isSelected
                                          ? AppColors.white
                                          : AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                OtherFunctionnalitiesItem(
                  onHomeworkTap: () {
                    final formattedDate = DateFormat(
                      'yyyy-MM-dd',
                    ).format(selectedDate!);
                    context.read<MyHomeworksByDayCubit>().getHomeworkByDay(
                      dueDate: DateTime.parse(formattedDate),
                    );
                    showModalBottomSheet(
                      context: context,
                      builder:
                          (_) => MyHomeworkByDayItem(dueDate: formattedDate),
                    );
                  },
                  onExamsTap: () {
                    final formattedDate = DateFormat(
                      'yyyy-MM-dd',
                    ).format(selectedDate!);
                    context.read<GetExamsByDayCubit>().getTodayAndNextWeekExams(
                      examDate: DateTime.parse(formattedDate),
                    );
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => MyExamByDayItem(dueDate: formattedDate),
                    );
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<GetTimetableByDayCubit, GetTimetableByDayState>(
                  builder: (context, state) {
                    if (state is GetTimetableByDayLoading) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: HelperFunctions.screenHeight(context) * .2,
                        ),
                        child: Lottie.asset(
                          AppAssets.loading,
                          height: 80,
                          width: 80,
                        ),
                      );
                    } else if (state is GetTimetableByDayLoaded) {
                      return SelectedTimetableByDay(timetable: state.timetable);
                    } else if (state is GetTimetableByDayFailure) {
                      return Center(child: Text(state.error));
                    }
                    return Center(
                      child: Text("Select a day to view timetable"),
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
