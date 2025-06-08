part of 'widgets_imports.dart';

class TodayEvent extends StatelessWidget {
  const TodayEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetTodayEventsCubit>()..getTodayEvents(),
      child: BlocBuilder<GetTodayEventsCubit, GetTodayEventsState>(
        builder: (context, state) {
          if (state is GetTodayEventsLoading) {
            return LoadingItem();
          } else if (state is GetTodayEventsLoaded) {
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
          } else if (state is GetTodayEventsFailure) {
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
