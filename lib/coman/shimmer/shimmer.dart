import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class BShimmerEffect extends StatelessWidget {
  const BShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 15,
    this.color,
  });

  final double width, height, borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const dark = false;
    // SHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? SColors.darkerGrey : SColors.white),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
