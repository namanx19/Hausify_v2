import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/brands/brand_card.dart';
import 'package:hausify_v2/common/widgets/layout/grid_layout.dart';
import 'package:hausify_v2/features/shop/controllers/brand_controller.dart';
import 'package:hausify_v2/features/shop/screens/brand/brand_products.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/shimmers/brand_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
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

              /// Brands Grid
              Obx(
                      () {
                    if(brandController.isLoading.value) return const HBrandsShimmer();

                    if (brandController.allBrands.isEmpty) {
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
                    }

                    return HGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        
                        return HBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand,)),);
                      },
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
