part of 'widgets_imports.dart';

class CustomClassroomDropdown extends StatefulWidget {
  final int selectedSchoolId;
  final Function(int) onChanged;
  const CustomClassroomDropdown({
    super.key,
    required this.selectedSchoolId,
    required this.onChanged,
  });

  @override
  State<CustomClassroomDropdown> createState() =>
      _CustomClassroomDropdownState();
}

class _CustomClassroomDropdownState extends State<CustomClassroomDropdown> {
  int? selectedClassroomId;
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    context
        .read<GetClassroomCubit>()
        .getClassroomBySchoolId(schoolId: widget.selectedSchoolId);
  }

  @override
  void didUpdateWidget(covariant CustomClassroomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedSchoolId != widget.selectedSchoolId) {
      selectedClassroomId = null;
      isDropdownOpen = false;

      // Fetch classrooms for new school ID
      context
          .read<GetClassroomCubit>()
          .getClassroomBySchoolId(schoolId: widget.selectedSchoolId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetClassroomCubit, GetClassroomState>(
      builder: (context, state) {
        if (state is GetClassroomLoading) {
          return LoadingDropDown();
        } else if (state is GetClassroomLoaded) {
          final classrooms = state.classrooms;
          final classroomModels = classrooms.cast<ClassroomModel>();

          if (selectedClassroomId == null && classroomModels.isNotEmpty) {
            selectedClassroomId = classroomModels.first.id!;
          }

          final selectedClassroom = classroomModels.firstWhere(
            (c) => c.id == selectedClassroomId,
            orElse: () => classroomModels.first,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDropdownOpen = !isDropdownOpen;
                  });
                },
                child: Container(
                  height: 45,
                  width: HelperFunctions.screenWidth(context),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: HelperFunctions.isDarkMode(context)
                          ? Colors.white
                          : AppColors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedClassroom.name ?? 'Select a classroom',
                        style: GoogleFonts.poppins(
                          color: HelperFunctions.isDarkMode(context)
                              ? Colors.white
                              : AppColors.black,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        isDropdownOpen
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: AppColors.textGrey,
                      ),
                    ],
                  ),
                ),
              ),
              if (isDropdownOpen)
                Container(
                  width: HelperFunctions.screenWidth(context),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: HelperFunctions.isDarkMode(context)
                          ? Colors.white
                          : AppColors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: classroomModels.map((classroom) {
                      return ListTile(
                        title: Text(
                          classroom.name ?? '',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        onTap: () {
                          setState(() {
                            selectedClassroomId = classroom.id;
                            isDropdownOpen = false;
                          });
                          widget.onChanged(selectedClassroomId!);
                        },
                      );
                    }).toList(),
                  ),
                ),
            ],
          );
        } else if (state is GetClassroomFailure) {
          return Text('Error: ${state.message}');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
