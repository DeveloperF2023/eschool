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
            return CustomerShimmer(
              height: HelperFunctions.screenHeight(context) * .05,
              width: HelperFunctions.screenWidth(context) * .9,
            );
            ;
          } else if (state is GetTodayAndNextWeekAttendanceLoaded) {
            return SizedBox(
              height: HelperFunctions.screenHeight(context) * .28,
              child: ListView.builder(
                  itemCount: state.attendance.length >= 3
                      ? 3
                      : state.attendance.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 10),
                  itemBuilder: (context, index) {
                    final attendance = state.attendance[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: HelperFunctions.isDarkMode(context)
                            ? AppColors.darkContainer
                            : AppColors.light,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red.withValues(alpha: 0.5)),
                                child: Center(
                                  child: Text(
                                    attendance.status!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 11),
                                  ),
                                ),
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(attendance.remarks!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 11)),
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
