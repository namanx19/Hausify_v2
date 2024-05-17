import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/brands/brand_card.dart';
import 'package:hausify_v2/common/widgets/products/sortable/sortable_products.dart';
import 'package:hausify_v2/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:hausify_v2/features/shop/controllers/brand_controller.dart';
import 'package:hausify_v2/features/shop/models/brand_model.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: HAppBar(title: Text(brand.name ,style: Theme.of(context).textTheme.headlineMedium,), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand Detail
            HBrandCard(showBorder: true, brand: brand,),
            SizedBox(height: HSizes.spaceBtwSections),

            FutureBuilder(
              future: controller.getBrandProducts(brand.id),
              builder: (context, snapshot) {

                /// handle loader, no record, or error message
                const loader = HVerticalProductShimmer();
                final widget = HCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if(widget != null) return widget;

                /// Record Found
                final brandProducts = snapshot.data!;
                return HSortableProducts(products: brandProducts ,);
              }
            ),
          ],
        ),
        ),
      ),

    );
  }
}
