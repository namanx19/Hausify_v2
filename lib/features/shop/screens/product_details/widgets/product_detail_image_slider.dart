import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hausify_v2/features/shop/controllers/product/images_controller.dart';
import 'package:hausify_v2/features/shop/models/product_model.dart';
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
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return HCurvedEdgesWidget(
      child: Container(
        color: dark ? HColors.darkerGrey : HColors.light,
        child: Stack(
          children: [
            /// Main Large Image of Product
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(HSizes.productImageRadius * 2.5),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: HColors.primaryColor,
                        ),
                      ),
                    );
                  }),
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
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx (() {
                    final imageSelected = controller.selectedProductImage.value == images[index];

                    return HRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      padding: const EdgeInsets.all(HSizes.sm),
                      backgroundColor: dark ? HColors.dark : HColors.white,
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      border: Border.all(color: imageSelected ? HColors.primaryColor : Colors.transparent),
                    );
                  })
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
