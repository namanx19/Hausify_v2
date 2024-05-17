import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/shimmers/shimmer.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/h_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class HPromoSlider extends StatelessWidget {
  const HPromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        () {
          if(controller.isLoading.value) return const HShimmerEffect(width: double.infinity, height: 190);

          // No Data Found
          if(controller.banners.isEmpty) {
            return const Center(child: Text('No Data Found!'));
          } else {
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) => controller.updatePageIndicator(index)
                  ),
                  items: controller.banners.map((banner) => HRoundedImage(imageUrl: banner.imageUrl, isNetworkImage: true, onPressed: () => Get.toNamed(banner.targetScreen),)).toList(),
                ),
                const SizedBox(height: HSizes.spaceBtwItems,),
                Center(
                  child: Obx(
                        () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for(int i=0; i<controller.banners.length; i++)
                          HCircularContainer(
                            width: 20,
                            height: 4,
                            margin: const EdgeInsets.only(right: 10),
                            backgroundColor: controller.carousalCurrentIndex.value == i ? HColors.primaryColor : HColors.grey,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }
    );
  }
}