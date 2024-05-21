import 'package:flutter/material.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class HCircularIcon extends StatelessWidget {
  /// A custom circular icon widget with a background color.

  /// Properties are :
  /// Container [width], [height], & [backgroundColor]

  /// Icon's [size], [color] & [onPressed]
  const HCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = HSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
          ? backgroundColor!
          : dark
            ? HColors.black.withOpacity(0.9)
            : HColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
        // color: dark ? HColors.black.withOpacity(0.9) : HColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,),
      ),
    );
  }
}