import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/texts/h_brand_title_text.dart';
import 'package:hausify_v2/utils/constants/enums.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class HBrandTitleWithVerifiedIcon extends StatelessWidget {
  const HBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = HColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max, /// #Modification1
      children: [
        /// #Modification4
        HBrandTitleText(
        title: title,
        color: textColor,
        maxLines: maxLines,
        textAlign: textAlign,
        brandTextSize: brandTextSize,
                  ),
        const SizedBox(width: HSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: HSizes.iconXs,)
      ],
    );
  }
}
