import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/images/h_circular_image.dart';
import 'package:hausify_v2/common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import 'package:hausify_v2/common/widgets/texts/product_price_text.dart';
import 'package:hausify_v2/common/widgets/texts/product_title_text.dart';
import 'package:hausify_v2/utils/constants/enums.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class HProductMetaData extends StatelessWidget {
  const HProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
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
                '25%',
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
            const HProductPriceText(
              price: '699',
              lineThrough: true,
            ),
            const SizedBox(
              width: HSizes.spaceBtwItems,
            ),
            const HProductPriceText(
              price: '499',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),

        /// Title
        const HProductTitleText(title: 'Green Nike Air Shoes'),
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
              'In Stock',
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
              image: HImages.cosmeticsIcon,
              height: 32,
              width: 32,
              overlayColor: dark ? HColors.white : HColors.black,
            ),
            const SizedBox(
              width: HSizes.spaceBtwItems,
            ),
            const HBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),



      ],
    );
  }
}
