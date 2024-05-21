import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/images/h_circular_image.dart';
import 'package:hausify_v2/common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import 'package:hausify_v2/common/widgets/texts/product_price_text.dart';
import 'package:hausify_v2/common/widgets/texts/product_title_text.dart';
import 'package:hausify_v2/features/shop/controllers/product/product_controller.dart';
import 'package:hausify_v2/utils/constants/enums.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class HProductMetaData extends StatelessWidget {
  const HProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and Sale Price
        Row(
          children: [
            /// Sale Tag
            HRoundedContainer(
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
            const SizedBox(
              width: HSizes.spaceBtwItems,
            ),

            /// Price  /// #Modification3
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text('₹${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),

            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(width: HSizes.spaceBtwItems,),

            HProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),

        /// Title
        HProductTitleText(title: product.title),
        const SizedBox(
          height: HSizes.spaceBtwItems / 1.5,
        ),

        /// Stock Status
        Row(
          children: [
            const HProductTitleText(title: 'Status'),
            const SizedBox(
              width: HSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          height: HSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            HCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              isNetworkImage: true,
              height: 32,
              width: 32,
              overlayColor: dark ? HColors.white : HColors.black,
            ),

            HBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
