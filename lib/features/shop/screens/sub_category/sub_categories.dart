import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hausify_v2/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/shop/controllers/category_controller.dart';
import 'package:hausify_v2/features/shop/models/category_model.dart';
import 'package:hausify_v2/utils/helpers/cloud_helper_functions.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/h_rounded_image.dart';
import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../all_products/all_products.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: HAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const HRoundedImage(
                  width: double.infinity,
                  imageUrl: HImages.promoBanner3,
                  applyImageRadius: true),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = HHorizontalProductShimmer();
                    final widget = HCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record found.
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              /// Handle Loader, No Record, OR Error Message
                              final widget = HCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              /// Record found
                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  /// Heading
                                  HSectionHeading(
                                      text: subCategory.name,
                                      onPressed: () => Get.to(() => AllProducts(title: subCategory.name, futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),))
                                  ),
                                  const SizedBox(
                                      height: HSizes.spaceBtwItems / 2),

                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) => const SizedBox(width: HSizes.spaceBtwItems,),
                                      itemBuilder: (context, index) => HProductCardHorizontal(product: products[index]),
                                    ),
                                  ),

                                  const SizedBox(
                                      height: HSizes.spaceBtwSections),
                                ],
                              );
                            });
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
