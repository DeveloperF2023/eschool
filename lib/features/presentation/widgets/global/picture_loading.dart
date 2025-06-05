part of 'widgets_imports.dart';

class PictureLoading extends StatelessWidget {
  final String imageUrl;
  const PictureLoading({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: 25,
      height: 25,
      fit: BoxFit.cover,
      placeholder:
          (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 25,
              height: 25,

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
