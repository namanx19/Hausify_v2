import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/icons/h_circular_icon.dart';
import 'package:hausify_v2/common/widgets/layout/grid_layout.dart';
import 'package:hausify_v2/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hausify_v2/features/shop/models/product_model.dart';
import 'package:hausify_v2/features/shop/screens/home/home.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          HCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              HGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) => HProductCardVertical(product: ProductModel.empty(),))
            ],
          ),
        ),
      ),
    );
  }
}
