import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/images/h_rounded_image.dart';
import 'package:hausify_v2/common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import 'package:hausify_v2/common/widgets/texts/product_price_text.dart';
import 'package:hausify_v2/common/widgets/texts/product_title_text.dart';
import 'package:hausify_v2/features/shop/models/product_model.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/h_circular_icon.dart';
import '../favourite_icon/favourite_icon.dart';

class HProductCardHorizontal extends StatelessWidget {
  const HProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

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
                SizedBox(
                  height: 120,
                  width: 120,
                  child: HRoundedImage(
                      imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                ),

                /// Sale Tag
                if(salePercentage!=null)
                Positioned(
                  top: 6,
                  left: 6,
                  child: HRoundedContainer(
                    radius: HSizes.sm,
                    backgroundColor: HColors.secondaryColor.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: HSizes.sm, vertical: HSizes.xs),
                    child: Text(
                      '$salePercentage%',
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
                  HFavouriteIcon(productId: product.id,dark: dark),

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HProductTitleText(
                          title: product.title,
                          smallSize: true),
                      const SizedBox(height: HSizes.spaceBtwItems / 2),
                      HBrandTitleWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),

                  const Spacer(),

                  /// Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// Price
                      Flexible(
                        child: Column(
                          children: [
                            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                  padding:  EdgeInsets.only(left: HSizes.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                  )
                              ),

                            Padding(
                              padding:  EdgeInsets.only(left: HSizes.sm),
                              child:    HProductPriceText(price: controller.getProductPrice(product),),
                            ),
                          ],
                        ),
                      ),

                      /// Add to Cart Button
                      Container(
                        decoration: BoxDecoration(
                            color: dark ? HColors.white : HColors.black, /// Change Color of Add to cart Btn
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(HSizes.cardRadiusMd),
                                bottomRight: Radius.circular(HSizes.productImageRadius)
                            )
                        ),
                        child: SizedBox(
                            width: HSizes.iconLg * 1.2,
                            height: HSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: dark ? HColors.black : HColors.white,),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
