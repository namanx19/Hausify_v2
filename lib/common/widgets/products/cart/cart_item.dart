import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/h_rounded_image.dart';
import '../../texts/h_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';


class HCartItem extends StatelessWidget {
  const HCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        HRoundedImage(
          imageUrl: HImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(HSizes.sm),
          backgroundColor: dark ? HColors.darkerGrey : HColors.light,
        ),
        const SizedBox(width: HSizes.spaceBtwItems,),


        /// Title, Price and Size
        Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HBrandTitleWithVerifiedIcon(title: 'Nike'),
                const Flexible(
                  child: HProductTitleText(title: 'Green Sports Shoesdsadsadasdadaadasdasdadaadas', maxLines: 1,),),
                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: 'UK 07', style: Theme.of(context).textTheme.bodyLarge),
                        ]
                    )
                )
              ],
            )
        )
      ],
    );
  }
}