import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class HRoundedContainer extends StatelessWidget {
  const HRoundedContainer({super.key,
    this.width,
    this.height,
    this.radius = HSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = HColors.borderPrimary,
    this.backgroundColor = HColors.white,
    this.padding,
    this.margin
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}