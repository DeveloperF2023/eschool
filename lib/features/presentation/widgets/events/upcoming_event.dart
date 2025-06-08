part of 'widgets_imports.dart';

class UpcomingEvent extends StatelessWidget {
  const UpcomingEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetEventsCubit>()..getEvents(),
      child: BlocBuilder<GetEventsCubit, GetEventsState>(
        builder: (context, state) {
          if (state is GetEventsLoading) {
            return LoadingItem();
          } else if (state is GetEventsSuccess) {
            if (state.events.isEmpty) {
              return NoDataFounded(
                noFoundedText: AppLocalization.of(
                  context,
                )!.translate("noEventsFound"),
                noFoundedSubtitle: AppLocalization.of(
                  context,
                )!.translate("noEventsFoundSubtitle"),
              );
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          AppLocalization.of(context)!.translate("todayEvents"),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.eventColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${state.events.length}",
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge!.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 15),
                    itemCount: state.events.length,
                    itemBuilder: (context, index) {
                      return EventItem(events: state.events[index]);
                    },
                  ),
                ),
              ],
            );
          } else if (state is GetEventsFailure) {
            return Text(
              AppLocalization.of(context)!.translate("errorLoadingEvents"),
              style: Theme.of(context).textTheme.titleLarge,
            );
          }
          return Container();
        },
      ),
    );
  }
}
