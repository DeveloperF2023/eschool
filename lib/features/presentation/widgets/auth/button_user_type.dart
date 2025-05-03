part of 'widgets_imports.dart';

class ButtonUserType extends StatelessWidget {
  final Color? buttonColor;
  final String textButton;
  final String iconUserTypeWhite;
  final String iconUserTypeBlack;
  final bool? isShowBorder;
  final void Function()? onNavigate;

  const ButtonUserType(
      {super.key,
      this.buttonColor,
      required this.textButton,
      required this.iconUserTypeWhite,
      this.isShowBorder,
      required this.iconUserTypeBlack,
      this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigate,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
            border: isShowBorder == true
                ? Border.all(
                    color: HelperFunctions.isDarkMode(context)
                        ? Colors.white
                        : Colors.black,
                    width: 1.3)
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              HelperFunctions.isDarkMode(context)
                  ? iconUserTypeWhite
                  : iconUserTypeBlack,
              height: 30,
              width: 30,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              textButton,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isShowBorder == true
                        ? (HelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : Colors.black)
                        : Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
