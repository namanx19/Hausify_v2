import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HCircularImage extends StatelessWidget {
  const HCircularImage({
    super.key,
    this.width = 56,
    this.height=56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit=BoxFit.cover,
    this.padding=HSizes.sm,
    this.isNetworkImage=false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??(HHelperFunctions.isDarkMode(context)
            ? HColors.black
            : HColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
       child: Image(
        fit: fit,
        image: isNetworkImage? NetworkImage(image): AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
      ),
    );
  }
}
