import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/brands/brand_card.dart';
import 'package:hausify_v2/common/widgets/products/sortable/sortable_products.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand Detail
            HBrandCard(showBorder: true),
            SizedBox(height: HSizes.spaceBtwSections),
            HSortableProducts(products: [],),
          ],
        ),
        ),
      ),

    );
  }
}
