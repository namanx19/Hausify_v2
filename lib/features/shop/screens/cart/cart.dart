import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/texts/product_price_text.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall,),),
      body: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (_, __) => const SizedBox(height: HSizes.spaceBtwSections,),
          itemBuilder: (_, index) => const Column(
            children: [
              HCartItem(),

              SizedBox(height: HSizes.spaceBtwItems,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70,),

                      /// Add Remove Buttons
                      HProductQuantityWithAddRemoveButton(),
                    ],
                  ),

                  /// Product Price at the bottom right corner of the card
                  HProductPriceText(price: '2999')
                ],
              )
            ],
          ),

        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: (){},
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




