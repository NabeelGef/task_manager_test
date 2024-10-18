import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/colorsapp.dart';

class AppCustomShimmer extends StatelessWidget {
  const AppCustomShimmer({
    super.key,
    this.radius = 0,
    required this.width,
    required this.height,
    this.verticalMargin = 0,
    this.horizontalMargin = 0,
  });
  final double? radius;
  final double width;
  final double height;
  final double? verticalMargin;
  final double? horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHighlightColor,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin!, vertical: verticalMargin!),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: kColorWhite,
          borderRadius: BorderRadius.circular(radius!),
        ),
      ),
    );
  }
}
