part of 'widgets_imports.dart';

class TodayClassesItem extends StatelessWidget {
  const TodayClassesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetTodayClassesCubit>()..getTodayClasses(),
      child: BlocBuilder<GetTodayClassesCubit, GetTodayClassesState>(
        builder: (context, state) {
          if (state is GetTodayClassesLoading) {
            return LoadingItem(
              height: HelperFunctions.screenHeight(context) * .1,
              width: HelperFunctions.screenWidth(context) * .28,
            );
          } else if (state is GetTodayClassesSuccess) {
            if (state.classes.isEmpty) {
              return Container(
                height: HelperFunctions.screenHeight(context) * .11,
                width: HelperFunctions.screenWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      HelperFunctions.isDarkMode(context)
                          ? AppColors.darkContainer
                          : AppColors.light,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      AppLocalization.of(context)!.translate("noClassesToday"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color:
                            HelperFunctions.isDarkMode(context)
                                ? Colors.white
                                : AppColors.black,
                      ),
                    ),
                  ),
                ),
              );
            }
            return SizedBox(
              height: HelperFunctions.screenHeight(context) * .07,
              width: HelperFunctions.screenWidth(context),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 15, right: 15),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.classes.length,
                itemBuilder: (context, index) {
                  final classes = state.classes[index];
                  final timeFormat = DateFormat('hh:mm:ss a');
                  return Container(
                    width: HelperFunctions.screenWidth(context) * .28,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: getSubjectColor(
                        classes.subject!.name!,
                      ).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${customFormatTime(classes.startTime!)} - ${customFormatTime(classes.endTime!)}',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge!.copyWith(fontSize: 11),
                        ),
                        SizedBox(height: 5),
                        Text(
                          HelperFunctions.truncateText(
                            classes.subject!.name!,
                            9,
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is GetTodayClassesError) {
            return Center(child: Text("Error:${state.message}"));
          }
          return Container();
        },
      ),
    );
  }
}
