import 'package:eschool_management/core/utils/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/local/local_service.dart';
import '../../widgets/global/widgets_imports.dart';

class SuccessLoginScreen extends StatelessWidget {
  const SuccessLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
                top: HelperFunctions.screenHeight(context) * .18,
                left: 15,
                right: 15),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Image.asset(AppAssets.successLogin),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalization.of(context)!.translate("requestSent"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppLocalization.of(context)!
                        .translate("requestSentSubtitle"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 12),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                    onNavigate: () {
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    textButton: "Back to log in",
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
