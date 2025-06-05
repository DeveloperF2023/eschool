part of 'widgets_imports.dart';

class CustomSchoolDropdown extends StatefulWidget {
  final void Function(int selectedSchoolId)? onChanged;

  const CustomSchoolDropdown({
    super.key,
    this.onChanged,
  });

  @override
  State<CustomSchoolDropdown> createState() => _CustomSchoolDropdownState();
}

class _CustomSchoolDropdownState extends State<CustomSchoolDropdown> {
  int? selectedSchoolId;
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSchoolCubit, GetSchoolState>(
      builder: (context, state) {
        if (state is GetSchoolLoading) {
          return LoadingDropDown();
        } else if (state is GetSchoolLoaded) {
          final schools = state.school;
          final schoolModels = schools.cast<SchoolModel>();

          if (selectedSchoolId == null && schoolModels.isNotEmpty) {
            selectedSchoolId = schoolModels.first.id!;
          }

          final selectedSchool = schoolModels.firstWhere(
            (s) => s.id == selectedSchoolId,
            orElse: () => schoolModels.first,
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
                        selectedSchool.name ?? 'Select a school',
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
                    children: schoolModels.map((school) {
                      return ListTile(
                        title: Text(
                          school.name ?? '',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        onTap: () {
                          setState(() {
                            selectedSchoolId = school.id;
                            isDropdownOpen = false;
                          });
                          if (widget.onChanged != null) {
                            widget.onChanged!(school.id!);
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
            ],
          );
        } else if (state is GetSchoolFailure) {
          return Text('Error: ${state.message}');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
