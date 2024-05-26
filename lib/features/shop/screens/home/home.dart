import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hausify_v2/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:hausify_v2/features/shop/screens/all_products/all_products.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/home_categories.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:hausify_v2/features/shop/screens/search/search.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            HPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  const HHomeAppBar(),
                  const SizedBox(
                    height: HSizes.spaceBtwSections,
                  ),

                  /// SearchBar
                  HSearchContainer(
                    text: 'Search in Store',
                    onTap: () => Get.to(const SearchScreen()),
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSections,
                  ),

                  /// Categories
                  const Padding(
                    padding: EdgeInsets.only(left: HSizes.defaultSpace),
                    child: Column(
                      children: [
                        HSectionHeading(
                          text: 'Popular Categories',
                          textColor: Colors.white,
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: HSizes.spaceBtwItems,
                        ),

                        /// Categories -- List View
                        HHomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Carousal Slider
                  const HPromoSlider(),
                  const SizedBox(
                    height: HSizes.spaceBtwSections,
                  ),

                  /// Heading
                  HSectionHeading(
                      text: 'Popular Products',
                      onPressed: () => Get.to(() => AllProducts(
                            title: 'Popular Products',
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          )
                      )
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems),

                  /// Popular Products Vertical Cards

                  Obx(() {
                    if (controller.isLoading.value) {
                      return const HVerticalProductShimmer();
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return HGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => HProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
