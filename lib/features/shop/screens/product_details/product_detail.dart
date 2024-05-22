import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/shop/screens/cart/cart.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/enums.dart';
import '../../models/product_model.dart';
import '../product_review/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            HProductImageSlider(product: product,),

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
                  HProductMetaData(product: product,),

                  /// -- Attributes
                  if(product.productType == ProductType.variable.toString())
                    HProductAttributes(product: product,),

                  if(product.productType == ProductType.variable.toString())
                    const SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.to(const CartScreen()), child: const Text('Go to cart'))),
                  const SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Description
                  const HSectionHeading(
                      text: 'Description', showActionButton: false),
                  const SizedBox(height: HSizes.spaceBtwItems),

                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ), // ReadMoreText

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: HSizes.spaceBtwItems / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HSectionHeading(
                          text: 'Reviews (199)', showActionButton: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                          onPressed: () => Get.to(() => const ProductReviewsScreen())),
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
