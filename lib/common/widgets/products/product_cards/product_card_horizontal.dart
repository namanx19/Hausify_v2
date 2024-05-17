import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/images/h_rounded_image.dart';
import 'package:hausify_v2/common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import 'package:hausify_v2/common/widgets/texts/product_price_text.dart';
import 'package:hausify_v2/common/widgets/texts/product_title_text.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/h_circular_icon.dart';
import '../favourite_icon/favourite_icon.dart';

class HProductCardHorizontal extends StatelessWidget {
  const HProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(HSizes.productImageRadius),
        color: dark ? HColors.darkerGrey : HColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          HRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(HSizes.sm),
            backgroundColor: dark ? HColors.dark : HColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: HRoundedImage(
                      imageUrl: HImages.productImage1, applyImageRadius: true),
                ),

                /// Sale Tag
                Positioned(
                  top: 6,
                  left: 6,
                  child: HRoundedContainer(
                    radius: HSizes.sm,
                    backgroundColor: HColors.secondaryColor.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: HSizes.sm, vertical: HSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: HColors.black),
                    ),
                  ),
                ),

                /// Favourite Icon Button
                Positioned(
                  top: -6,
                  right: -6,
                  child:
                  HFavouriteIcon(productId: '',dark: dark),

                  // HCircularIcon(
                  //   icon: Iconsax.heart5,
                  //   color: Colors.red,
                  //
                  //   ///backgroundColor: dark ? Colors.black : HColors.light, /// Change color of heart icon btn bg
                  // ),

                ),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: HSizes.sm, left: HSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HProductTitleText(
                          title: 'Green Nike Half Sleeves Shirt',
                          smallSize: true),
                      SizedBox(height: HSizes.spaceBtwItems / 2),
                      HBrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// Pricing
                      const Flexible(child: HProductPriceText(price: '256.0')),

                      /// Add to Cart Button

                      Container(
                        decoration:  BoxDecoration(

                            color: dark ? HColors.white : HColors.black, /// Change Color of Add to cart Btn
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(HSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    HSizes.productImageRadius))),
                        child: SizedBox(
                            width: HSizes.iconLg * 1.2,
                            height: HSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,

                                color: dark ? HColors.black : HColors.white,
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
