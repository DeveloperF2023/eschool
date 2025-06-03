part of 'widgets_imports.dart';

class SelectedTimetableByDay extends StatelessWidget {
  final List<TimetableByDayEntity> timetable;
  const SelectedTimetableByDay({super.key, required this.timetable});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          HelperFunctions.screenHeight(context) -
          50 -
          HelperFunctions.screenHeight(context) * .06,
      child: ListView.builder(
        itemCount: timetable.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final timetableItem = timetable[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                SizedBox(
                  width: HelperFunctions.screenWidth(context) * .25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat.jm().format(
                          DateTime.parse(
                            '1970-01-01 ${timetableItem.startTime!}',
                          ),
                        ),
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        DateFormat.jm().format(
                          DateTime.parse(
                            '1970-01-01 ${timetableItem.endTime!}',
                          ),
                        ),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color:
                              HelperFunctions.isDarkMode(context)
                                  ? AppColors.textWhite
                                  : AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 3,
                  height: 70,
                  color: getSubjectColor(timetableItem.subjectName!),
                ),
                Container(
                  width: HelperFunctions.screenWidth(context) - 105,
                  padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  color: getSubjectColor(
                    timetableItem.subjectName!,
                  ).withValues(alpha: 0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timetableItem.subjectName!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color:
                              HelperFunctions.isDarkMode(context)
                                  ? AppColors.white
                                  : Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                margin: EdgeInsets.only(bottom: 5, top: 3),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${EndpointsConstants.imageUrl}${timetableItem.teacherPicture}",
                                  imageBuilder:
                                      (context, imageProvider) => Container(
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
                                            "${EndpointsConstants.imageUrl}${timetableItem.teacherPicture}",
                                      ),
                                  errorWidget:
                                      (context, url, error) =>
                                          Icon(Icons.error),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                timetableItem.teacherName!,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  color:
                                      HelperFunctions.isDarkMode(context)
                                          ? AppColors.white
                                          : AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),
                          timetableItem.status == "scheduled"
                              ? Container()
                              : Container(
                                height: 20,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 3,
                                ),
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color:
                                      timetableItem.status == "canceled"
                                          ? AppColors.canceledCourseColor
                                          : AppColors.rescheduledCourseColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  timetableItem.status!,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppColors.white),
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
      ),
    );
  }
}
