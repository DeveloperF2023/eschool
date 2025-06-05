part of 'widgets_imports.dart';

class MyExamByDayItem extends StatelessWidget {
  final String dueDate;
  const MyExamByDayItem({super.key, required this.dueDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.screenWidth(context),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      color:
          HelperFunctions.isDarkMode(context)
              ? AppColors.dark
              : AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.of(context)!.translate("examsToday"),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Iconify(
                    Ri.close_circle_line,
                    color:
                        HelperFunctions.isDarkMode(context)
                            ? AppColors.white
                            : Colors.black,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          BlocBuilder<GetExamsByDayCubit, GetExamsByDayState>(
            builder: (context, state) {
              if (state is GetExamsByDayLoading) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: HelperFunctions.screenHeight(context) * .2,
                  ),
                  child: Center(
                    child: Lottie.asset(
                      AppAssets.loading,
                      height: 80,
                      width: 80,
                    ),
                  ),
                );
              } else if (state is GetExamsByDayLoaded) {
                final exams = state.exams;
                if (exams.isEmpty) {
                  return Center(
                    child: Text(
                      "No homework for today",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: exams.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final exam = exams[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.borderSecondary),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: HelperFunctions.screenHeight(context) * .1,
                            width: HelperFunctions.screenWidth(context) * .25,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${EndpointsConstants.imageUrl}${exam.teacherPicture}",
                              imageBuilder:
                                  (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              placeholder:
                                  (context, url) => PictureLoading(
                                    imageUrl:
                                        "${EndpointsConstants.imageUrl}${exam.teacherPicture}",
                                  ),
                              errorWidget:
                                  (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: HelperFunctions.screenWidth(context) * .6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      exam.title!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleLarge!.copyWith(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      exam.subjectName!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        color: getSubjectColor(
                                          exam.subjectName!,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      height: 10,
                                      width: 1,
                                      color: AppColors.grey,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      exam.teacherName!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        color:
                                            HelperFunctions.isDarkMode(context)
                                                ? AppColors.white
                                                : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "${DateFormat.Hm().format(DateTime.parse('1970-01-01 ${exam.startTime!}'))} - ${DateFormat.Hm().format(DateTime.parse('1970-01-01 ${exam.endTime!}'))}",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is GetExamsByDayFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
