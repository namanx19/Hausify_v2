import 'package:flutter/material.dart';
import 'package:hausify_v2/common/styles/shadows.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../icons/h_circular_icon.dart';
import '../../images/h_rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class HProductCardVertical extends StatelessWidget {
  const HProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    /// Container with side paddings, edges, color, radius and shadow
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [HShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(HSizes.productImageRadius),
          color: dark ? HColors.darkerGrey : HColors.light,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            HRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(HSizes.sm),
              backgroundColor: dark ? HColors.dark : HColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  HRoundedImage(
                    imageUrl: HImages.productImage1,
                    applyImageRadius: true,
                    backgroundColor: dark ? HColors.dark : HColors.light,
                  ),

                  /// Sale Tag
                  Positioned(
                    top: 6,
                    left: 6,
                    child: HRoundedContainer(
                      radius: HSizes.sm,
                      backgroundColor: HColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: HSizes.sm, vertical: HSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: HColors.black),),
                    ),
                  ),

                  /// Favourite Icon Button
                  Positioned(
                      top: -6,
                      right: -6,
                      child: HCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                        backgroundColor: dark ? HColors.dark : HColors.light,
                      ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwItems / 2,),



            /// Brief Product Details
            const Padding(
                padding: EdgeInsets.only(left: HSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  SizedBox(height: HSizes.spaceBtwItems / 2),

                  HBrandTitleWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),

            /// Spacer(),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Price
                const Padding(
                  padding:  EdgeInsets.only(left: HSizes.sm),
                  child:    HProductPriceText(price: '2999',),
                ),

                /// Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                      color: HColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(HSizes.cardRadiusMd),
                          bottomRight: Radius.circular(HSizes.productImageRadius)
                      )
                  ),
                  child: const SizedBox(
                      width: HSizes.iconLg * 1.2,
                      height: HSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(
                          Iconsax.add,
                          color: HColors.white,),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}






