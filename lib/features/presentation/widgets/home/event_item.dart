part of 'widgets_imports.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetEventsCubit>()..getEvents(),
      child: BlocBuilder<GetEventsCubit, GetEventsState>(
        builder: (context, state) {
          if (state is GetEventsLoading) {
            return CustomShimmer(child: Container());
          } else if (state is GetEventsSuccess) {
            return SizedBox(
              height: HelperFunctions.screenHeight(context) * .21,
              child: ListView.builder(
                itemCount: state.events.length,
                padding: const EdgeInsets.only(left: 15, right: 15),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final event = state.events[index];
                  final dateParts =
                      getDayAndMonth(event.eventDate!, Intl.getCurrentLocale());
                  return Container(
                      width: HelperFunctions.screenWidth(context) * .8,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColors.eventColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    getDayName(event.eventDate!,
                                        Intl.getCurrentLocale()),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontSize: 18, color: Colors.black),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Iconify(
                                      Ic.sharp_keyboard_arrow_right,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(dateParts['day'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(dateParts['month'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                    fontSize: 40,
                                                    color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        child: VerticalDivider(
                                          color: Colors.white,
                                          thickness: 1,
                                          endIndent: 5,
                                          indent: 5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            event.startTime != null ||
                                                    event.endTime != null
                                                ? "${DateFormat.jm().format(combineWithToday(event.startTime!))} - ${DateFormat.jm().format(combineWithToday(event.endTime!))}"
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Center(
                                              child: Text(
                                                event.location!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: AppColors
                                                            .eventColor),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            children: [
                                              Iconify(
                                                MaterialSymbols
                                                    .location_on_outline,
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                  HelperFunctions.truncateText(
                                                      event.title!, 15),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge!
                                                      .copyWith(
                                                          color: Colors.black)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            children: [
                                              Iconify(
                                                Ic.baseline_outlined_flag,
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                  HelperFunctions.truncateText(
                                                      event.description!, 15),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge!
                                                      .copyWith(
                                                          color: Colors.black)),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]));
                },
              ),
            );
          } else if (state is GetEventsFailure) {
            return Center(
              child: Text("Error:${state.message}"),
            );
          }
          return Container();
        },
      ),
    );
  }
}
