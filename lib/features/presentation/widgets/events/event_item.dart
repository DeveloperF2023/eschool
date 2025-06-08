part of 'widgets_imports.dart';

class EventItem extends StatelessWidget {
  final EventEntity events;
  const EventItem({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            AppRoutes.eventDetail,
            arguments: events.id,
          ),
      child: Container(
        height: HelperFunctions.screenHeight(context) * .14,
        margin: EdgeInsetsGeometry.only(left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              HelperFunctions.isDarkMode(context)
                  ? AppColors.darkContainer
                  : AppColors.white,
          boxShadow: [
            BoxShadow(
              color:
                  HelperFunctions.isDarkMode(context)
                      ? Colors.black26
                      : Colors.grey.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: HelperFunctions.screenHeight(context) * .15,
                  width: HelperFunctions.screenWidth(context) * .3,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${EndpointsConstants.imageUrl}${events.eventPicture}",
                    imageBuilder:
                        (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withValues(alpha: 0.3),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                        ),
                    placeholder:
                        (context, url) => EventPictureLoading(
                          height: HelperFunctions.screenHeight(context) * .15,
                          width: HelperFunctions.screenWidth(context) * .3,
                          imageUrl:
                              "${EndpointsConstants.imageUrl}${events.eventPicture}",
                        ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.eventColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        events.type!,
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 7),
              child: SizedBox(
                width: HelperFunctions.screenWidth(context) * .55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      events.title!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 40,
                      child: Text(
                        HelperFunctions.truncateText(events.description!, 50),
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Iconify(
                          Ic.outline_timer,
                          color: AppColors.textGrey,
                          size: 15,
                        ),
                        Text(
                          " ${formatTime(events.startTime!)} - ${formatTime(events.endTime!)}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Iconify(
                          MaterialSymbols.location_on_outline,
                          color: AppColors.textGrey,
                          size: 15,
                        ),
                        SizedBox(width: 4),
                        Text(
                          events.location!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
