import 'package:eschool_management/features/presentation/manager/user/login_user/login_user_cubit.dart';
import 'package:eschool_management/features/presentation/widgets/global/widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/local/local_service.dart';
import '../../widgets/auth/widgets_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginUserCubit, LoginUserState>(
        listener: (context, state) {
          if (state is LoginUserLoaded) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (state is LoginUserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "Your login request is pending approval please retry again after checking your mail if its approved"),
              ),
            );
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: HelperFunctions.screenHeight(context) * .6,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: HeaderAuth(
                  title: AppLocalization.of(context)!.translate("loginTitle"),
                  subtitle:
                      AppLocalization.of(context)!.translate("loginSubtitle"),
                  imageHeader: AppAssets.welcome,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 40, left: 15, right: 15),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      AppLocalization.of(context)!
                          .translate("loginDescription"),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Email is required'
                            : null,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter your login code here",
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginUserCubit, LoginUserState>(
                      builder: (context, state) {
                        if (state is LoginUserLoading) {
                          return PrimaryButton(
                            onNavigate: null,
                            textButton: "Logging in...",
                          );
                        }
                        return PrimaryButton(
                          onNavigate: () async {
                            if (_formKey.currentState!.validate()) {
                              await context.read<LoginUserCubit>().loginUser(
                                    code: emailController.text,
                                  );
                            }
                          },
                          textButton: "Log In",
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
