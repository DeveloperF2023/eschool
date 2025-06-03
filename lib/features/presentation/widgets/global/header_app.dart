part of 'widgets_imports.dart';

class HeaderApp extends StatelessWidget {
  final String title;
  const HeaderApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          Container(
            height: 35,
            width: 35,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    HelperFunctions.isDarkMode(context)
                        ? AppColors.grey
                        : AppColors.black,
              ),
            ),
            child: Iconify(
              Ic.round_notifications_none,
              color:
                  HelperFunctions.isDarkMode(context)
                      ? Colors.white
                      : Colors.black,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
