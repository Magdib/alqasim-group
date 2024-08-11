import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double hight;
  final double width;
  final BoxShape? shapeBorder;
  final double? borderRadius;
  final bool isVerticalRadius;
  final bool isHorizontalRadius;
  const ShimmerWidget.rectangle({
    super.key,
    required this.hight,
    required this.width,
    this.shapeBorder = BoxShape.rectangle,
    this.borderRadius,
    this.isVerticalRadius = false,
    this.isHorizontalRadius = false,
  });
  const ShimmerWidget.circle({
    super.key,
    required this.hight,
    required this.width,
    this.shapeBorder = BoxShape.circle,
    this.borderRadius,
    this.isVerticalRadius = false,
    this.isHorizontalRadius = false,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
            color: AppColors.grey,
            shape: shapeBorder!,
            borderRadius: isVerticalRadius
                ? BorderRadius.vertical(
                    top: Radius.circular(borderRadius ?? 12))
                : isHorizontalRadius
                    ? BorderRadius.horizontal(
                        left: Radius.circular(borderRadius ?? 12))
                    : BorderRadius.circular(borderRadius ?? 12)),
      ),
    );
  }
}
