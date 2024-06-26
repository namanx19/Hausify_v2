import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/loaders/animation_loader.dart';
import 'package:hausify_v2/features/shop/controllers/product/cart_controller.dart';
import 'package:hausify_v2/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:hausify_v2/features/shop/screens/checkout/checkout.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cartController = CartController.instance;
    final navController = Get.put(NavigationController());
    return Scaffold(
      appBar: HAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall,),),
      body: Obx(
          () {

            /// Nothing found widget
            final emptyWidget = HAnimationLoaderWidget(
                text: 'Whoops! Cart is Empty!',
                animation: HImages.cartAnimation,
                showAction: true,
                actionText: 'Let\'s fill it',
                //onActionPressed: () => Get.off(() => const NavigationMenu()),
                onActionPressed: () => navController.selectedIndex.value = 0);
            if (cartController.cartItems.isEmpty) {
              return emptyWidget;
            } else {
              return const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(HSizes.defaultSpace),

                  /// Items in cart
                  child: HCartItems(),
                            ),
              );
            }
          }
      ),


      bottomNavigationBar: cartController.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
            child: ElevatedButton(
              onPressed: () => Get.to(() => const CheckoutScreen()),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                  () => Text(
                      'Checkout ₹ ${cartController.totalCartPrice.value}'
                    ),
                  ),
                  const SizedBox(width: HSizes.spaceBtwItems,),
                  const Icon(Iconsax.arrow_right)
                ],
              ),
            ),
          ),
      );
  }
}




