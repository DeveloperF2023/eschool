part of 'widgets_imports.dart';

class NoDataFounded extends StatelessWidget {
  final String noFoundedText;
  const NoDataFounded({super.key, required this.noFoundedText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HelperFunctions.screenHeight(context) * .10,
      width: HelperFunctions.screenWidth(context) * .9,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        noFoundedText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
      )),
    );
  }
}
