part of 'widgets_imports.dart';

class PictureLoading extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const PictureLoading({
    super.key,
    required this.imageUrl,
    this.width = 25,
    this.height = 25,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder:
          (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
      errorWidget: (context, url, error) => Icon(Icons.error, size: 25),
    );
  }
}

class EventPictureLoading extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const EventPictureLoading({
    super.key,
    required this.imageUrl,
    this.width = 25,
    this.height = 25,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder:
          (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
      errorWidget: (context, url, error) => Icon(Icons.error, size: 25),
    );
  }
}
