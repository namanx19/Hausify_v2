import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/layout/grid_layout.dart';
import 'package:hausify_v2/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hausify_v2/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/shop/controllers/category_controller.dart';
import 'package:hausify_v2/features/shop/models/category_model.dart';
import 'package:hausify_v2/features/shop/screens/all_products/all_products.dart';
import 'package:hausify_v2/features/shop/screens/store/widgets/category_brands.dart';
import 'package:hausify_v2/utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/constants/sizes.dart';

class HCategoryTab extends StatelessWidget {
  const HCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              CategoryBrands(category: category),
              const SizedBox(height: HSizes.spaceBtwItems),

              /// -- Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id,),
                builder: (context, snapshot) {

                  // Helper Functions: Handle Loader, No Record or Error Message
                  final response = HCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const HVerticalProductShimmer());
                  if(response != null) return response;

                  // Record Found
                  final products = snapshot.data!;

                  return Column(
                    children: [
                      HSectionHeading(text: 'You might like', onPressed: () => Get.to(AllProducts(title: category.name,
                      futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                      ))),
                      const SizedBox(height: HSizes.spaceBtwItems),

                      HGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => HProductCardVertical(product: products[index],)),
                      const SizedBox(height: HSizes.spaceBtwSections),
                    ],
                  );
                }
              ),

            ],
          ),
        ),
      ],
    );
  }
}
