part of 'widgets_imports.dart';

class LoadingDropDown extends StatelessWidget {
  const LoadingDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: HelperFunctions.screenWidth(context),
      decoration: BoxDecoration(
        border: Border.all(
          color: HelperFunctions.isDarkMode(context)
              ? Colors.white
              : AppColors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '',
            style: GoogleFonts.poppins(
              color: HelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : AppColors.black,
              fontSize: 14,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: AppColors.textGrey,
          ),
        ],
      ),
    );
  }
}
