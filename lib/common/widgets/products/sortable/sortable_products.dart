import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hausify_v2/features/shop/controllers/product/all_products_controller.dart';
import 'package:hausify_v2/features/shop/models/product_model.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class HSortableProducts extends StatelessWidget {
  const HSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort Products based on selected option
            controller.sortProducts(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity',
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: HSizes.spaceBtwSections),

        /// Products
        Obx(
          () => HGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => HProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
