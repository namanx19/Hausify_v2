import 'package:flutter/material.dart';
import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/h_circular_image.dart';
import '../texts/h_brand_title_text_with_verified_icon.dart';

class HBrandCard extends StatelessWidget {
  const HBrandCard({
    super.key,
    this.onTap,
    required this.showBorder, required this.brand,
  });

  final bool showBorder;
  final void Function() ? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      /// Container Design
      child: HRoundedContainer(
        padding: const EdgeInsets.all(HSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [

            /// -- Icon
            Flexible(
              child: HCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor:
                HHelperFunctions.isDarkMode(context)
                    ? HColors.white
                    : HColors.black,
              ),
            ),

            const SizedBox(
                width: HSizes.spaceBtwItems / 2),

            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  HBrandTitleWithVerifiedIcon(
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
