import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/images/h_circular_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HVerticalImageText extends StatelessWidget {
  const HVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = HColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: HSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            HCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: HSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              // overlayColor: HHelperFunctions.isDarkMode(context)
              //     ? HColors.light
              //     : HColors.dark,
            ),

            // Issue#5  fixed for categories
            // Container(
            //   height: 56,
            //   width: 56,
            //   padding: const EdgeInsets.all(HSizes.sm),
            //   decoration: BoxDecoration(
            //     color:
            //         backgroundColor ?? (dark ? HColors.black : HColors.white),
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: HColors.black,
            //
            //       /// #Issue5
            //     ),
            //   ),
            // ),

            /// Texts
            const SizedBox(
              height: HSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
