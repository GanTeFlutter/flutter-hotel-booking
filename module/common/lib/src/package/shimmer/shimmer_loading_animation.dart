import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final class ShimmerLoadingAnimation extends StatelessWidget {
  const ShimmerLoadingAnimation({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8,
    this.baseColor,
    this.highlightColor,
  });

  final double? width;
  final double? height;
  final double borderRadius;

  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
