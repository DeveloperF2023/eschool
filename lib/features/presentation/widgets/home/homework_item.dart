part of 'widgets_imports.dart';

class HomeworkItem extends StatelessWidget {
  const HomeworkItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              locator<TodayAndNextWeekHomeworkCubit>()
                ..getTodayAndNextWeekHomeworks(),
      child: BlocBuilder<
        TodayAndNextWeekHomeworkCubit,
        TodayAndNextWeekHomeworkState
      >(
        builder: (context, state) {
          if (state is TodayAndNextWeekHomeworkLoading) {
            return LoadingItem(
              height: HelperFunctions.screenHeight(context) * .22,
              width: HelperFunctions.screenWidth(context) * .45,
            );
          } else if (state is TodayAndNextWeekHomeworkLoaded) {
            if (state.homeworks.isEmpty) {
              return NoDataFounded(
                noFoundedText: AppLocalization.of(
                  context,
                )!.translate("noHomeworkFoundTitle"),
                noFoundedSubtitle: AppLocalization.of(
                  context,
                )!.translate("noHomeworkFound"),
              );
            }
            return SizedBox(
              height: HelperFunctions.screenHeight(context) * .23,
              child: ListView.builder(
                itemCount: state.homeworks.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15, right: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final homework = state.homeworks[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: Row(
                      children: [
                        Container(
                          height: HelperFunctions.screenHeight(context) * .23,
                          width: HelperFunctions.screenWidth(context) * .45,
                          padding: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.borderSecondary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3,
                                        ),
                                        margin: EdgeInsets.only(
                                          top: 5,
                                          right: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: getSubjectColor(
                                            homework.subjectName!,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            homework.subjectName!,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleSmall!.copyWith(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 9,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 5,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          child: Text(
                                            HelperFunctions.truncateText(
                                              homework.title!,
                                              20,
                                            ),
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.headlineSmall,
                                          ),
                                        ),
                                        Text(
                                          HelperFunctions.truncateText(
                                            homework.description!,
                                            48,
                                          ),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall!.copyWith(
                                            color: AppColors.textGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Due: ",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall!.copyWith(
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.textGrey,
                                          ),
                                        ),
                                        Text(
                                          formatExamDate(homework.dueDate!),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall!.copyWith(
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.textGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      homework.teacherName!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      margin: EdgeInsets.only(
                                        bottom: 5,
                                        top: 3,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${EndpointsConstants.imageUrl}${homework.teacherImage}",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                        placeholder:
                                            (context, url) => PictureLoading(
                                              imageUrl:
                                                  "${EndpointsConstants.imageUrl}${homework.teacherImage}",
                                            ),
                                        errorWidget:
                                            (context, url, error) =>
                                                Icon(Icons.error),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is TodayAndNextWeekHomeworkFailure) {}
          return Container();
        },
      ),
    );
  }
}
