part of 'widgets_imports.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({super.key});

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  Future<String?> _getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FutureBuilder<String?>(
                future: _getUserType(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    String? userType = snapshot.data;
                    if (userType == 'student') {
                      return Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                AppColors.primaryColor.withValues(alpha: 0.2)),
                        child: Center(
                          child: Image.asset(
                            AppAssets.studentType,
                            height: 42,
                            width: 42,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else if (userType == 'teacher') {
                      return Image.asset(
                        AppAssets.teacherType,
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      );
                    } else {
                      return Image.asset(
                        AppAssets.parentType,
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      );
                    }
                  } else {
                    return Image.asset(
                      AppAssets.teacher,
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    );
                  }
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocProvider(
                    create: (context) =>
                        locator<PersonalUserInfoCubit>()..fetchUserInfo(),
                    child: BlocBuilder<PersonalUserInfoCubit,
                        PersonalUserInfoState>(
                      builder: (context, state) {
                        if (state is PersonalUserInfoLoading) {
                          return Container();
                        } else if (state is PersonalUserInfoLoaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12, left: 10),
                                  child: Text(
                                    state.userInfo['name']!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 15),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      state.userInfo['role']!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 10),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 10,
                                      child: VerticalDivider(
                                        color: AppColors.primaryColor,
                                        thickness: 1,
                                        indent: 5,
                                        endIndent: 5,
                                      ),
                                    ),
                                    Text(
                                      state.userInfo['classroom_name']!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (state is PersonalUserInfoFailure) {
                          return Center(
                            child: Text("Error: ${state.message}"),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 35,
            width: 35,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: HelperFunctions.isDarkMode(context)
                        ? AppColors.grey
                        : AppColors.black)),
            child: Iconify(
              Ic.round_notifications_none,
              color: HelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
