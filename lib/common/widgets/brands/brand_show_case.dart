import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/shimmers/shimmer.dart';
import 'package:hausify_v2/features/shop/models/brand_model.dart';
import 'package:hausify_v2/features/shop/screens/brand/brand_products.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class HBrandShowcase extends StatelessWidget {
  const HBrandShowcase({
    super.key,
    required this.images, required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: HRoundedContainer(
        showBorder: true,
        borderColor: HColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(HSizes.md),
        margin: const EdgeInsets.only(bottom: HSizes.spaceBtwItems),
        child: Column(
          children: [
            /// -- Brand with Products Count
            HBrandCard(showBorder: false, brand: brand,),
            const SizedBox(height: HSizes.spaceBtwItems),

            /// -- Brand Top 3 Product Images
            Row(
                children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: HRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(HSizes.md),
        margin: const EdgeInsets.only(right: HSizes.sm),
        backgroundColor: HHelperFunctions.isDarkMode(context)
            ? HColors.darkerGrey
            : HColors.light,
        child:  CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const HShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )
      ),
    );
  }
}