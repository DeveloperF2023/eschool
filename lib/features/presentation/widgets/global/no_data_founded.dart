part of 'widgets_imports.dart';

class NoDataFounded extends StatelessWidget {
  final String noFoundedText;
  final String noFoundedSubtitle;
  const NoDataFounded({
    super.key,
    required this.noFoundedText,
    required this.noFoundedSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Image.asset(
            AppAssets.noData,
            height: 180,
            width: 180,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            noFoundedText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              noFoundedSubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
