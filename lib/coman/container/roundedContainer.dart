import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';

class roundedContainer extends StatelessWidget {
  const roundedContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    const dark = false;
    // SHelperFunctions.isDarkMode(context);

    return Container(
        decoration: BoxDecoration(
          color: dark ? SColors.white.withOpacity(0.15) : SColors.lightGrey,
          borderRadius: BorderRadius.circular(100),
        ),
        child: child);
  }
}
