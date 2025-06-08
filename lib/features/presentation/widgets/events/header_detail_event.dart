part of 'widgets_imports.dart';

class HeaderDetailEvent extends StatelessWidget {
  final String imageUrl;
  const HeaderDetailEvent({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HelperFunctions.screenHeight(context) * .4,
      child: CachedNetworkImage(
        imageUrl: "${EndpointsConstants.imageUrl}$imageUrl",
        imageBuilder:
            (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        placeholder:
            (context, url) => EventPictureLoading(
              height: HelperFunctions.screenHeight(context) * .4,
              imageUrl: "${EndpointsConstants.imageUrl}$imageUrl",
            ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
