part of 'widgets_imports.dart';

class SlideItem extends StatelessWidget {
  final SlideData slideData;
  final List<SlideData> slides;
  final int currentIndex;
  final PageController pageController;

  const SlideItem(
      {super.key,
      required this.slideData,
      required this.slides,
      required this.currentIndex,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .52,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
                child: Image.asset(
              slideData.imagePath,
              fit: BoxFit.contain,
              height: 360,
              width: MediaQuery.sizeOf(context).width * .9,
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              slideData.title,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
