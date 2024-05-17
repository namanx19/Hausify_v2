import 'package:flutter/material.dart';
import 'package:hausify_v2/features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class HBrandShowcase extends StatelessWidget {
  const HBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return HRoundedContainer(
      showBorder: true,
      borderColor: HColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(HSizes.md),
      margin: const EdgeInsets.only(bottom: HSizes.spaceBtwItems),
      child: Column(
        children: [
          /// -- Brand with Products Count
          HBrandCard(showBorder: false, brand: BrandModel.empty(),),
          const SizedBox(height: HSizes.spaceBtwItems),

          /// -- Brand Top 3 Product Images
          Row(
              children: images.map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
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
        child:  Image(
            fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}