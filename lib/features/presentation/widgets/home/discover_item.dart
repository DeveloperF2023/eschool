part of 'widgets_imports.dart';

class DiscoverItem extends StatelessWidget {
  final String icon;
  final String discoverText;
  const DiscoverItem({
    super.key,
    required this.icon,
    required this.discoverText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color:
                HelperFunctions.isDarkMode(context)
                    ? AppColors.darkContainer
                    : AppColors.light,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Iconify(icon, size: 27, color: AppColors.primaryColor),
          ),
        ),
        SizedBox(height: 5),
        Text(
          discoverText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
