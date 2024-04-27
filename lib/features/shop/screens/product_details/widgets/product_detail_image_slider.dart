import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/h_circular_icon.dart';
import '../../../../../common/widgets/images/h_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HProductImageSlider extends StatelessWidget {
  const HProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return HCurvedEdgesWidget(
      child: Container(
        color: dark ? HColors.darkerGrey : HColors.light,
        child: Stack(
          children: [
            /// Main Large Image of Product
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(HSizes.productImageRadius * 2.5),
                child: Center(
                  child: Image(image: AssetImage(HImages.productImage7),),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: HSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: HSizes.spaceBtwItems,),
                  itemBuilder: (_, index) => HRoundedImage(
                    width: 80,
                    backgroundColor: dark ? HColors.dark : HColors.white,
                    border: Border.all(color: HColors.primaryColor),
                    padding: const EdgeInsets.all(HSizes.sm),
                    imageUrl: HImages.productImage1,
                  ),
                ),
              ),
            ),

            const HAppBar(
              showBackArrow: true,
              actions: [
                HCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                  backgroundColor: Colors.transparent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}