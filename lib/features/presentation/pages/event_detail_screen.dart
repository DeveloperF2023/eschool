import 'package:eschool_management/core/utils/local/local_service.dart';
import 'package:eschool_management/dependencies_injection.dart';
import 'package:eschool_management/features/presentation/manager/events/get_detail_event/get_detail_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/extension/format_time.dart';
import '../../../core/utils/helper_functions.dart';
import '../widgets/events/widgets_imports.dart';

class EventDetailScreen extends StatelessWidget {
  final int eventId;

  const EventDetailScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) =>
                locator<GetDetailEventCubit>()
                  ..getDetailEvent(eventId: eventId),
        child: BlocBuilder<GetDetailEventCubit, GetDetailEventState>(
          builder: (context, state) {
            if (state is GetDetailEventLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color:
                      HelperFunctions.isDarkMode(context)
                          ? AppColors.white
                          : AppColors.dark,
                ),
              );
            } else if (state is GetDetailEventLoaded) {
              final event = state.event;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    collapsedHeight: HelperFunctions.screenHeight(context) * .4,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: HeaderDetailEvent(
                        imageUrl: event.eventPicture!,
                      ),
                    ),
                    backgroundColor:
                        HelperFunctions.isDarkMode(context)
                            ? AppColors.dark
                            : AppColors.white,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Text(
                          event.title!,
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          event.description!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              AppLocalization.of(context)!.translate("from"),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${formatTime(event.startTime!)} - ${formatTime(event.endTime!)}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ],
              );
            } else if (state is GetDetailEventFailure) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
