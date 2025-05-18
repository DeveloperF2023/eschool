part of 'widgets_imports.dart';

class AttendanceItem extends StatelessWidget {
  const AttendanceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetTodayAndNextWeekAttendanceCubit>()
        ..getTodayAndNextWeekAttendance(),
      child: BlocBuilder<GetTodayAndNextWeekAttendanceCubit,
          GetTodayAndNextWeekAttendanceState>(
        builder: (context, state) {
          if (state is GetTodayAndNextWeekAttendanceLoading) {
            return LoadingItem(
              height: HelperFunctions.screenHeight(context) * .14,
              width: HelperFunctions.screenWidth(context) * .4,
              scrollDirection: Axis.horizontal,
            );
            ;
          } else if (state is GetTodayAndNextWeekAttendanceLoaded) {
            return SizedBox(
              height: HelperFunctions.screenHeight(context) * .14,
              child: ListView.builder(
                  itemCount: state.attendance.length >= 3
                      ? 3
                      : state.attendance.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(bottom: 10, left: 15),
                  itemBuilder: (context, index) {
                    final attendance = state.attendance[index];
                    return Container(
                      width: HelperFunctions.screenWidth(context) * .4,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: HelperFunctions.isDarkMode(context)
                              ? AppColors.darkContainer
                              : AppColors.light,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 12,
                                width:
                                    HelperFunctions.screenWidth(context) * .4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: getAttendanceStatusColor(
                                        attendance.status!)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  attendance.status!.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: getAttendanceStatusColor(
                                              attendance.status!)),
                                ),
                                Text(
                                  formatExamDate(attendance.date!),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 11),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              HelperFunctions.truncateText(
                                  attendance.remarks!, 40),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
          } else if (state is GetTodayAndNextWeekAttendanceFailure) {
            return Center(
              child: Text("Error: ${state.message}"),
            );
          }
          return Container();
        },
      ),
    );
  }
}
