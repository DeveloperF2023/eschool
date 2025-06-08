part of 'widgets_imports.dart';

class AttendanceItem extends StatelessWidget {
  const AttendanceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              locator<GetTodayAndNextWeekAttendanceCubit>()
                ..getTodayAndNextWeekAttendance(),
      child: BlocBuilder<
        GetTodayAndNextWeekAttendanceCubit,
        GetTodayAndNextWeekAttendanceState
      >(
        builder: (context, state) {
          if (state is GetTodayAndNextWeekAttendanceLoading) {
            return LoadingItem(
              height: HelperFunctions.screenHeight(context) * .14,
              width: HelperFunctions.screenWidth(context) * .4,
              scrollDirection: Axis.horizontal,
            );
          } else if (state is GetTodayAndNextWeekAttendanceLoaded) {
            if (state.attendance.isEmpty) {
              return NoDataFounded(
                noFoundedText: AppLocalization.of(
                  context,
                )!.translate("noAttendanceTitle"),
                noFoundedSubtitle: AppLocalization.of(
                  context,
                )!.translate("noAttendanceSubtitle"),
              );
            }
            return ListView.builder(
              itemCount:
                  state.attendance.length >= 3 ? 3 : state.attendance.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 10, left: 15),
              itemBuilder: (context, index) {
                final attendance = state.attendance[index];
                return Container(
                  width: HelperFunctions.screenWidth(context) * .9,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: getAttendanceStatusColor(
                                attendance.status!,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Iconify(
                                getAttendanceStatusIcon(attendance.status!),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  HelperFunctions.truncateText(
                                    attendance.remarks!,
                                    40,
                                  ),
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 10),
                                ),
                                Row(
                                  children: [
                                    Iconify(
                                      Ic.twotone_date_range,
                                      color: Colors.grey,
                                      size: 13,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      formatExamDate(attendance.date!),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        width: HelperFunctions.screenWidth(context) * .2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.borderPrimary.withValues(
                              alpha: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: getAttendanceStatusColor(
                                  attendance.status!,
                                ),
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              attendance.status!,
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall!.copyWith(
                                fontSize: 12,
                                color: getAttendanceStatusColor(
                                  attendance.status!,
                                ),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is GetTodayAndNextWeekAttendanceFailure) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return Container();
        },
      ),
    );
  }
}
