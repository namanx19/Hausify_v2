import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hausify_v2/common/widgets/brands/brand_card.dart';
import 'package:hausify_v2/common/widgets/layout/grid_layout.dart';
import 'package:hausify_v2/features/shop/screens/brand/brand_products.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const HSectionHeading(text: 'Brands', showActionButton: false),
              const SizedBox(height: HSizes.spaceBtwItems),

              /// -- Brands
              HGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => HBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    );
  }
}
