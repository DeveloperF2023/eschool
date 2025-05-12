part of 'widgets_imports.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalization.of(context)!.translate("welcomeBack"),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 12),
              ),
              Text(
                AppLocalization.of(context)!.translate("headerHome"),
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
          Container(
            height: 35,
            width: 35,
            padding: EdgeInsets.all(5),
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
