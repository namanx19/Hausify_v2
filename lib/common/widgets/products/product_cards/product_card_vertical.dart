import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/styles/shadows.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import 'package:hausify_v2/features/shop/controllers/product/product_controller.dart';
import 'package:hausify_v2/features/shop/screens/product_details/product_detail.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../icons/h_circular_icon.dart';
import '../../images/h_rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class HProductCardVertical extends StatelessWidget {
  const HProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    // double cardWidth = HHelperFunctions.screenWidth() * 0.4; // Adjust the percentage as needed
    // double cardHeight = HHelperFunctions.screenHeight() * 0.18;

    /// Container with side paddings, edges, color, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [HShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(HSizes.productImageRadius),
          color: dark ? HColors.black : HColors.light, /// Change color of card bg
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            HRoundedContainer(
              height: 170, /// #Issue9.1
              width: 170,
              padding: const EdgeInsets.all(HSizes.sm),
              backgroundColor: dark ? Colors.black : HColors.light, /// Change color of img card bg
              child: Stack(
                children: [
                  /// Thumbnail Image
                  Center(
                    child: HRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      backgroundColor: dark ? Colors.black : HColors.light, /// Change color of img card bg
                      isNetworkImage: true,
                    ),
                  ),

                  /// Sale Tag
                  Positioned(
                    top: 6,
                    left: 6,
                    child: HRoundedContainer(
                      radius: HSizes.sm,
                      backgroundColor: HColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: HSizes.sm, vertical: HSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: HColors.black),),
                    ),
                  ),

                  /// Favourite Icon Button
                  Positioned(
                      top: -6,
                      right: -6,
                      child: HCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                        backgroundColor: dark ? Colors.black : HColors.light, /// Change color of heart icon btn bg
                      ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwItems / 2,),



            /// Brief Product Details
            Padding(
                padding: EdgeInsets.only(left: HSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  SizedBox(height: HSizes.spaceBtwItems / 2),

                  HBrandTitleWithVerifiedIcon(title: product.brand!.name),
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
    );
  }
}






