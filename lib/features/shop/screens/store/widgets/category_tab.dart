import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/layout/grid_layout.dart';
import 'package:hausify_v2/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/shop/models/product_model.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class HCategoryTab extends StatelessWidget {
  const HCategoryTab({super.key, required this.category});


  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const HBrandShowcase(images: [
                HImages.productImage3,
                HImages.productImage2,
                HImages.productImage1
              ]),

              /// -- Products
              HSectionHeading(text: 'You might like', onPressed: () {}),
              const SizedBox(height: HSizes.spaceBtwItems),

              HGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => HProductCardVertical(product: ProductModel.empty())),
              const SizedBox(height: HSizes.spaceBtwSections)
            ],
          ),
        ),
      ],
    );
  }
}
