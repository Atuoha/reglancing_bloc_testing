import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:re_glance_bloc_testing/weather_api_bloc_testing/constants/constants.dart';

class KCachedImage extends StatelessWidget {
   KCachedImage({
    super.key,
    required this.image,
    this.height = 150,
    this.width = 150,
  });

  final String image;
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Image.asset(
        AppConstants.imgPlaceholder,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Image.asset(
        AppConstants.imgPlaceholder,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
