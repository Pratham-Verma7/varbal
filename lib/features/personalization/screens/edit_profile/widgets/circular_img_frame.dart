import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:someone_datingapp/comman/shimmer/shimmer.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';
import 'package:someone_datingapp/utils/helpers/helper_functions.dart';

class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = Sizes.s / 2,
    this.isNetworkImage = false,
    this.addPadding = true,
  });

  final BoxFit? fit;

  final String image;

  final bool isNetworkImage;

  final Color? overlayColor;

  final Color? backgroundColor;

  final double width, height, padding;

  final bool addPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: addPadding ? EdgeInsets.all(padding) : null,
        decoration: BoxDecoration(
// If image background color is null then switch it to light and dark mode color design.
          color: backgroundColor ??
              (SHelperFunctions.isDarkMode(context)
                  ? SColors.black
                  : SColors.white),
          borderRadius: BorderRadius.circular(1000),
        ),
        color: overlayColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    color: overlayColor,
                    fit: fit,
                    imageUrl: image,
                    progressIndicatorBuilder: (context, url, progress) =>
                        BShimmerEffect(
                      width: width,
                      height: height,
                      borderRadius: 1000,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    color: overlayColor,
                    image: AssetImage(image),
                  ),
          ),
        ));
  }
}
