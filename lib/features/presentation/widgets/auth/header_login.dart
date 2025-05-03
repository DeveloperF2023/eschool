part of 'widgets_imports.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColorSplash,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.presentationApp)),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: HelperFunctions.screenHeight(context) * .5,
              width: HelperFunctions.screenWidth(context),
              color: AppColors.backgroundColorSplash.withValues(alpha: 0.8),
            )),
        Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Schooly✨",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            )),
        Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)!.translate("welcomeLogin"),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.white),
                ),
              ],
            )),
        Positioned(
            bottom: 30,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.of(context)!.translate("loginTitle"),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 27, color: AppColors.white),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  AppLocalization.of(context)!.translate("subtitleLogin"),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 12, color: AppColors.greyTextColor),
                ),
              ],
            )),
      ],
    );
  }
}
