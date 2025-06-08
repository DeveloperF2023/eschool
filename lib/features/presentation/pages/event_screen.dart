import 'package:eschool_management/core/utils/local/local_service.dart';
import 'package:eschool_management/features/presentation/widgets/global/widgets_imports.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/helper_functions.dart';
import '../widgets/events/widgets_imports.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: HelperFunctions.screenHeight(context) * .06,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: HeaderApp(
                  title: AppLocalization.of(context)!.translate("events"),
                ),
              ),
              backgroundColor:
                  HelperFunctions.isDarkMode(context)
                      ? AppColors.dark
                      : AppColors.white,
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 8.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            HelperFunctions.isDarkMode(context)
                                ? AppColors.darkContainer
                                : AppColors.light,
                        borderRadius: BorderRadius.circular(16),
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
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Life is not a problem to be solved, but a reality to be experienced.",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "— Søren Kierkegaard",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,

                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                decoration: BoxDecoration(
                  color:
                      HelperFunctions.isDarkMode(context)
                          ? AppColors.darkContainer
                          : AppColors.light,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  isScrollable: false,
                  labelPadding: const EdgeInsets.only(left: 5, right: 5),
                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  unselectedLabelColor:
                      HelperFunctions.isDarkMode(context)
                          ? AppColors.white
                          : AppColors.black,
                  labelColor:
                      HelperFunctions.isDarkMode(context)
                          ? AppColors.white
                          : AppColors.black,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 12),
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  tabs: [
                    Tab(text: AppLocalization.of(context)!.translate("recent")),
                    Tab(text: AppLocalization.of(context)!.translate("today")),
                    Tab(
                      text: AppLocalization.of(context)!.translate("upcoming"),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: TabBarView(
                  children: [RecentEvent(), TodayEvent(), UpcomingEvent()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
