part of 'widgets_imports.dart';

class HomeworkBySubject extends StatelessWidget {
  final int subjectId;
  const HomeworkBySubject({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              locator<HomeworkBySubjectCubit>()
                ..getHomeworkBySubject(subjectId: subjectId),
      child: BlocBuilder<HomeworkBySubjectCubit, HomeworkBySubjectState>(
        builder: (context, state) {
          print("State Homework Subject $state");
          if (state is HomeworkBySubjectLoading) {
            return LoadingItem();
          } else if (state is HomeworkBySubjectLoaded) {
            final homeworkList = state.homeworks;
            if (homeworkList.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: HelperFunctions.screenHeight(context) * .1,
                ),
                child: Column(
                  children: [
                    Text(
                      AppLocalization.of(
                        context,
                      )!.translate("noHomeworkFoundTitle"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppLocalization.of(context)!.translate("noHomeworkFound"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              );
            }
            return SizedBox(
              height: HelperFunctions.screenHeight(context) * .4,
              child: ListView.builder(
                itemCount: homeworkList.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final homework = homeworkList[index];
                  return Container(
                    margin: EdgeInsets.only(left: 15, bottom: 10, right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            HelperFunctions.isDarkMode(context)
                                ? AppColors.borderSecondary
                                : AppColors.borderPrimary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homework.title!,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Iconify(
                                      MaterialSymbols.date_range_outline,
                                      color: AppColors.textGrey,
                                      size: 14,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      DateFormat.yMMMd().format(
                                        DateTime.parse(homework.dueDate!),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: AppColors.textGrey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              homework.description!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 3,
                                ),
                                margin: EdgeInsets.only(left: 10, top: 5),
                                decoration: BoxDecoration(
                                  color:
                                      homework.status == 'Today'
                                          ? AppColors.biologyColor.withValues(
                                            alpha: 0.1,
                                          )
                                          : homework.status == 'This Week'
                                          ? AppColors.spanishColor.withValues(
                                            alpha: 0.1,
                                          )
                                          : homework.status == 'Past Due'
                                          ? AppColors.englishColor.withValues(
                                            alpha: 0.2,
                                          )
                                          : AppColors.artColor.withValues(
                                            alpha: 0.2,
                                          ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    homework.status!,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      color:
                                          homework.status == 'Today'
                                              ? AppColors.biologyColor
                                              : homework.status == 'This Week'
                                              ? AppColors.spanishColor
                                              : homework.status == 'Past Due'
                                              ? AppColors.englishColor
                                              : AppColors.artColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is HomeworkBySubjectFailure) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
