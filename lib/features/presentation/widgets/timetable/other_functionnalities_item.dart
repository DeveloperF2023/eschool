part of 'widgets_imports.dart';

class OtherFunctionnalitiesItem extends StatelessWidget {
  final void Function()? onHomeworkTap;
  final void Function()? onExamsTap;
  const OtherFunctionnalitiesItem({
    super.key,
    this.onHomeworkTap,
    this.onExamsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: onHomeworkTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderSecondary,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "My Homework",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        HelperFunctions.isDarkMode(context)
                            ? AppColors.white
                            : AppColors.textGrey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: onExamsTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderSecondary,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "My Exams",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        HelperFunctions.isDarkMode(context)
                            ? AppColors.white
                            : AppColors.textGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
