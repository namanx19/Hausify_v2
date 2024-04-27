import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../product_review/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const HBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            const HProductImageSlider(),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: HSizes.defaultSpace,
                  left: HSizes.defaultSpace,
                  bottom: HSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating and Share Button
                  const HRatingAndShare(),

                  /// Price, Title, Stock and Brand
                  const HProductMetaData(),

                  /// -- Attributes

                  const HProductAttributes(),

                  const SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Description
                  const HSectionHeading(
                      text: 'Description', showActionButton: false),
                  const SizedBox(height: HSizes.spaceBtwItems),

                  const ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but idasjflasfjlasjflasjflajdsflj',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ), // ReadMoreText

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HSectionHeading(
                          text: 'Reviews (199)', showActionButton: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                          onPressed: () => Get.to(()=>const ProductReviewsScreen())),
                    ],
                  ),

                  const SizedBox(height: HSizes.spaceBtwSections),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
