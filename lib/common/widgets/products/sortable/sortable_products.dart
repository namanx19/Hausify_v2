import 'package:flutter/material.dart';
import 'package:hausify_v2/features/shop/models/product_model.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class HSortableProducts extends StatelessWidget {
  const HSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity',]
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: HSizes.spaceBtwSections),

        /// Products
        HGridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => HProductCardVertical(product: ProductModel.empty(),))
      ],
    );
  }
}
