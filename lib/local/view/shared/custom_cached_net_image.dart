import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/colors.dart';

import 'shimmer_loading.dart';

class CustomCachedNetImage extends StatelessWidget {
  const CustomCachedNetImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    required this.canReDownload,
    this.reDownload,
    this.fit,
    this.borderRadius,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final bool canReDownload;
  final void Function()? reDownload;
  final BoxFit? fit;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: SizedBox(
        height: height ?? 150,
        width: width ?? 100,
        child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => ShimmerWidget.rectangle(
                  hight: height ?? 150,
                  width: width ?? 100,
                  isHorizontalRadius: true,
                  borderRadius: borderRadius ?? 0,
                ),
            //Can Re Get is Getx Controller Variable
            errorWidget: (context, url, error) => Container(
                  alignment: Alignment.center,
                  color: AppColors.grey,
                  height: height ?? 150,
                  width: width ?? 100,
                  child: Center(
                    child: const Icon(
                      Icons.error_rounded,
                      // size: 35,
                      color: AppColors.white,
                    ),
                  ),
                )),
      ),
    );
  }
}
