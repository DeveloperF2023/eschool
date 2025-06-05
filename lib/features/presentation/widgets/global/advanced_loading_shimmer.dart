part of 'widgets_imports.dart';

class AdvancedLoadingShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final Axis? scrollDirection;
  const AdvancedLoadingShimmer(
      {super.key, this.height, this.width, this.scrollDirection});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HelperFunctions.screenHeight(context) * .18,
      width: HelperFunctions.screenWidth(context) * .9,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: scrollDirection!,
        padding: EdgeInsets.only(left: 15),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => AdvancedLayoutLoading(),
      ),
    );
  }
}

class AdvancedLayoutLoading extends StatelessWidget {
  const AdvancedLayoutLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: HelperFunctions.screenWidth(context) * .7,
                  height: 20,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius:
                        BorderRadius.circular(10), // customize as needed
                  ),
                ),
              ),
              SizedBox(height: 10),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: HelperFunctions.screenWidth(context) * .7,
                  height: 20,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius:
                        BorderRadius.circular(10), // customize as needed
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
