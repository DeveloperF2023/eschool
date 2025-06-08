part of 'widgets_imports.dart';

class MyHomeworkByDayItem extends StatelessWidget {
  final String dueDate;
  const MyHomeworkByDayItem({super.key, required this.dueDate});

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
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Homework today",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color:
                        HelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Iconify(
                    Ri.close_circle_line,
                    color:
                        HelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : Colors.black,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          BlocBuilder<MyHomeworksByDayCubit, MyHomeworksByDayState>(
            builder: (context, state) {
              if (state is MyHomeworksByDayLoading) {
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
              } else if (state is MyHomeworksByDayLoaded) {
                final homeworks = state.homeworks;
                if (homeworks.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: HelperFunctions.screenHeight(context) * .15,
                    ),
                    child: Column(
                      children: [
                        Text(
                          AppLocalization.of(
                            context,
                          )!.translate("noHomeworkFoundTitle"),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 10),
                        Text(
                          AppLocalization.of(
                            context,
                          )!.translate("noHomeworkFound"),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: homeworks.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final homework = homeworks[index];
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
                                  "${EndpointsConstants.imageUrl}${homework.teacherPicture}",
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
                                        "${EndpointsConstants.imageUrl}${homework.teacherPicture}",
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
                                      homework.title!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleLarge!.copyWith(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                      ),
                                    ),
                                    homework.attachment == null
                                        ? Container()
                                        : Container(
                                          height: 10,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: AppColors.grayColor,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Attachment",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.titleSmall!.copyWith(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  HelperFunctions.truncateText(
                                    homework.description!,
                                    60,
                                  ),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.copyWith(
                                    color:
                                        HelperFunctions.isDarkMode(context)
                                            ? AppColors.light
                                            : AppColors.textGrey,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      homework.subjectName!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        color: getSubjectColor(
                                          homework.subjectName!,
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
                                      homework.teacherName!,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is MyHomeworksByDayFailure) {
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
