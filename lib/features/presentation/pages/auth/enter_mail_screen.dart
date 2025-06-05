import 'package:eschool_management/core/constants/app_colors.dart';
import 'package:eschool_management/core/routes/app_routes.dart';
import 'package:eschool_management/core/utils/local/local_service.dart';
import 'package:eschool_management/dependencies_injection.dart';
import 'package:eschool_management/features/presentation/widgets/global/widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/helper_functions.dart';
import '../../manager/user/request_code/request_code_cubit.dart';
import '../../widgets/auth/widgets_imports.dart';

class EnterEmailScreen extends StatefulWidget {
  final String userType;
  final int classroomId;
  const EnterEmailScreen({
    super.key,
    required this.userType,
    required this.classroomId,
  });

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : AppColors.white,
      body: BlocProvider<RequestCodeCubit>(
        create: (_) => locator<RequestCodeCubit>()
          ..requestCode(
              email: emailController.text,
              role: widget.userType,
              classroomId: widget.classroomId),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: HelperFunctions.screenHeight(context) * .5,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: HeaderLogin(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalization.of(context)!.translate("signIn"),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 22, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          AppLocalization.of(context)!
                              .translate("signInSubtitle"),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColors.textGrey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          AppLocalization.of(context)!
                              .translate("emailAddress"),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 5),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) => value == null || value.isEmpty
                                ? 'Email is required'
                                : null,
                            decoration: InputDecoration(
                              hintText: "Example@mail.com",
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      onNavigate: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<RequestCodeCubit>()
                              .requestCode(
                                email: emailController.text,
                                role: widget.userType,
                                classroomId: widget.classroomId,
                              )
                              .whenComplete(() => Navigator.pushNamed(
                                  context, AppRoutes.successLogin));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("There is a problem in network"),
                            ),
                          );
                        }
                      },
                      isPadding: false,
                      textButton:
                          AppLocalization.of(context)!.translate("login"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
