import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/icons/h_circular_icon.dart';
import 'package:hausify_v2/common/widgets/layout/grid_layout.dart';
import 'package:hausify_v2/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hausify_v2/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:hausify_v2/features/shop/controllers/product/favourites_controller.dart';
import 'package:hausify_v2/features/shop/screens/home/home.dart';
import 'package:hausify_v2/utils/helpers/cloud_helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
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
              Obx(
                () => FutureBuilder(
                    future: controller.favoriteProducts(),
                    builder: (context, snapshot) {
                      /// Nothing Found Widget
                      final emptyWidget = HAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty ... ',
                        animation: HImages.pencilAnimation,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );

                      const loader = HVerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget =
                          HCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return HGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => HProductCardVertical(
                                product: products[index],
                              ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
