part of 'widgets_imports.dart';

class PersonalInfoUser extends StatefulWidget {
  const PersonalInfoUser({super.key});

  @override
  State<PersonalInfoUser> createState() => _PersonalInfoUserState();
}

class _PersonalInfoUserState extends State<PersonalInfoUser> {
  String? name = "";
  Future<String?> _getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  Future<String?> _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name");
  }

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HelperFunctions.screenHeight(context) * .15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor.withValues(alpha: 0.6)),
      child: Row(
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
                  return Image.asset(
                    AppAssets.studentType,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
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
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    name!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
