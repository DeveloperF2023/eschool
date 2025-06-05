part of 'widgets_imports.dart';

class ResourceBySubject extends StatelessWidget {
  final int subjectId;
  const ResourceBySubject({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              locator<ResourceBySubjectCubit>()
                ..getResourcesBySubject(subjectId: subjectId),
      child: BlocBuilder<ResourceBySubjectCubit, ResourceBySubjectState>(
        builder: (context, state) {
          print("State Homework Subject $state");
          if (state is ResourceBySubjectLoading) {
            return LoadingItem();
          } else if (state is ResourceBySubjectLoaded) {
            final resource = state.resources;
            return SizedBox(
              height: HelperFunctions.screenHeight(context) * .4,
              child: ListView.builder(
                itemCount: resource.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final resourceList = resource[index];
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  resourceList.title!,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  resourceList.type!,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    color:
                                        resourceList.type == 'textbook'
                                            ? AppColors.biologyColor
                                            : resourceList.type == 'video'
                                            ? AppColors.spanishColor
                                            : AppColors.artColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              resourceList.description!,
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

                                child: Center(
                                  child: Row(
                                    children: [
                                      resourceList.type == 'textbook'
                                          ? Iconify(
                                            MaterialSymbols
                                                .picture_as_pdf_outline,
                                            size: 15,
                                          )
                                          : Iconify(Ph.video_camera, size: 15),
                                      SizedBox(width: 5),
                                      Text(
                                        resourceList.url!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium!.copyWith(
                                          color:
                                              resourceList.type == 'textbook'
                                                  ? AppColors.biologyColor
                                                  : resourceList.type == 'video'
                                                  ? AppColors.spanishColor
                                                  : AppColors.artColor,
                                        ),
                                      ),
                                    ],
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
          } else if (state is ResourceBySubjectFailure) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
