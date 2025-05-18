part of 'widgets_imports.dart';

class ExamItem extends StatefulWidget {
  const ExamItem({super.key});

  @override
  State<ExamItem> createState() => _ExamItemState();
}

class _ExamItemState extends State<ExamItem> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: HelperFunctions.isDarkMode(context)
            ? Colors.black26
            : AppColors.light,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.of(context)!.translate("exams"),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                AppLocalization.of(context)!.translate("seeAll"),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
          if (isExpanded) ...[
            SizedBox(height: 10),
            BlocProvider(
              create: (context) => locator<GetTodayNextWeekExamCubit>()
                ..getTodayAndNextWeekExams(),
              child: BlocBuilder<GetTodayNextWeekExamCubit,
                  GetTodayNextWeekExamState>(
                builder: (context, state) {
                  if (state is GetTodayNextWeekExamLoading) {
                    return AdvancedLoadingShimmer(
                      scrollDirection: Axis.vertical,
                    );
                  } else if (state is GetTodayNextWeekExamLoaded) {
                    return ListView.builder(
                      itemCount:
                          state.exams.length >= 3 ? 3 : state.exams.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 5),
                      itemBuilder: (context, index) {
                        final exam = state.exams[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: getSubjectColor(exam.subjectName!),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        getSubjectSvg(exam.subjectName!),
                                        height: 30,
                                        width: 30,
                                        fit: BoxFit.contain,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        exam.title!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            exam.subjectName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          SizedBox(
                                            height: 10,
                                            child: VerticalDivider(
                                              color: HelperFunctions.isDarkMode(
                                                      context)
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          Text(
                                            exam.teacherName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    formatExamDate(exam.examDate!),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    "${customFormatTime(exam.startTime!)} - ${customFormatTime(exam.endTime!)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is GetTodayNextWeekExamFailure) {
                    return Center(
                      child: Text("Error: ${state.message}"),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
          SizedBox(height: 10),
          IconButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            icon: Iconify(
              isExpanded
                  ? Ic.round_keyboard_arrow_up
                  : Ic.round_keyboard_arrow_down,
              color: HelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
