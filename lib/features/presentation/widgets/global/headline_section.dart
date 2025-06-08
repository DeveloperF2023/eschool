part of 'widgets_imports.dart';

class HeadlineSection extends StatelessWidget {
  final String headline;
  final void Function()? onSeeAllPressed;
  const HeadlineSection({
    super.key,
    required this.headline,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(
            headline,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          child: Text(
            AppLocalization.of(context)!.translate("seeAll"),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
