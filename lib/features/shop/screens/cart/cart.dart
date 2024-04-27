import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:hausify_v2/features/shop/screens/checkout/checkout.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall,),),
      body: const Padding(
        padding: EdgeInsets.all(HSizes.defaultSpace),

        /// Items in cart
        child: HCartItems(),
      ),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Checkout ₹ 2999'
              ),
              SizedBox(width: HSizes.spaceBtwItems,),
              Icon(Iconsax.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}




