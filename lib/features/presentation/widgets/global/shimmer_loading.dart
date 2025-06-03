part of 'widgets_imports.dart';

class LoadingItem extends StatelessWidget {
  final double? height;
  final double? width;
  final Axis? scrollDirection;
  const LoadingItem({
    super.key,
    this.height,
    this.width,
    this.scrollDirection = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15),
        physics: BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => CustomerShimmer(height: height, width: width),
      ),
    );
  }
}

class CustomerShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomerShimmer({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade300, // base color of the shimmer
          borderRadius: BorderRadius.circular(16), // customize as needed
        ),
      ),
    );
  }
}
