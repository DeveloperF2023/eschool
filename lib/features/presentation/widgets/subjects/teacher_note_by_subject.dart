part of 'widgets_imports.dart';

class TeacherNoteBySubject extends StatelessWidget {
  final int subjectId;
  const TeacherNoteBySubject({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              locator<GetTeacherNotesCubit>()
                ..getTeacherNotes(subjectId: subjectId),
      child: BlocBuilder<GetTeacherNotesCubit, GetTeacherNotesState>(
        builder: (context, state) {
          print("State Teacher Notes Subject $state");
          if (state is GetTeacherNotesLoading) {
            return LoadingItem();
          } else if (state is GetTeacherNotesLoaded) {
            final teacherNote = state.teacherNotes;
            final storedStudentId = state.studentId;
            print('Student ID : $storedStudentId');
            if (teacherNote.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: HelperFunctions.screenHeight(context) * .1,
                ),
                child: Column(
                  children: [
                    Text(
                      AppLocalization.of(
                        context,
                      )!.translate("noNotesFoundTitle"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppLocalization.of(
                        context,
                      )!.translate("noNotesFoundSubtitle"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              );
            }
            return SizedBox(
              height: HelperFunctions.screenHeight(context) * .4,
              child: ListView.builder(
                itemCount: teacherNote.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final teacherNotes = teacherNote[index];
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
                                  teacherNotes.note!,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Iconify(
                                        MaterialSymbols.date_range_outline,
                                        color: AppColors.textGrey,
                                        size: 15,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        DateFormat.yMMMMd().format(
                                          DateTime.parse(teacherNotes.date!),
                                        ),
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        teacherNotes.type == 'performance'
                                            ? AppColors.biologyColor.withValues(
                                              alpha: 0.2,
                                            )
                                            : teacherNotes.type == 'behavior'
                                            ? AppColors.spanishColor.withValues(
                                              alpha: 0.2,
                                            )
                                            : teacherNotes.type == 'general'
                                            ? AppColors.artColor.withValues(
                                              alpha: 0.2,
                                            )
                                            : AppColors.canceledCourseColor
                                                .withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    teacherNotes.type!,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      color:
                                          teacherNotes.type == 'performance'
                                              ? AppColors.biologyColor
                                              : teacherNotes.type == 'behavior'
                                              ? AppColors.spanishColor
                                              : teacherNotes.type == 'general'
                                              ? AppColors.artColor
                                              : AppColors.canceledCourseColor,
                                    ),
                                  ),
                                ),
                                if (teacherNotes.studentId == storedStudentId)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.light,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "For me",
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.titleLarge,
                                        ),
                                      ),
                                    ), // Replace with your widget
                                  )
                                else if (teacherNotes.studentId == null)
                                  Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is GetTeacherNotesFailure) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
