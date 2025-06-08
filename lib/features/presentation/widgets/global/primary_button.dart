part of 'widgets_imports.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onNavigate;
  final String? textButton;
  final Color? buttonColor;
  final bool? isPadding;

  const PrimaryButton(
      {super.key,
      required this.onNavigate,
      this.textButton = "Log in",
      this.buttonColor = AppColors.primaryColor,
      this.isPadding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigate,
      child: Container(
        height: 50,
        margin: isPadding == true
            ? EdgeInsets.symmetric(horizontal: 10)
            : EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            textButton!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.textWhite),
          ),
        ),
      ),
    );
  }
}
