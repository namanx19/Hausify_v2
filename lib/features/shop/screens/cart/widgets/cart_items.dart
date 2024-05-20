import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hausify_v2/features/shop/controllers/product/cart_controller.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';


/// HCartItem class is for creating Single Cart Item Card
/// HCartItems class is for creating a list of Cart Items

class HCartItems extends StatelessWidget {
  const HCartItems({super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;


  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: HSizes.spaceBtwSections,),
        itemBuilder: (_, index) => Obx(
            () {
              final item = cartController.cartItems[index];
              return Column(
                children: [
                  // Cart Item
                  HCartItem(cartItem: item,),

                  if(showAddRemoveButtons) const SizedBox(height: HSizes.spaceBtwItems,),

                  if(showAddRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 70,),

                            /// Add Remove Buttons
                            HProductQuantityWithAddRemoveButton(
                              quantity: item.quantity,
                              add: () => cartController.addOneToCart(item),
                              remove: () => cartController.removeOneFromCart(item),
                            ),
                          ],
                        ),

                        /// Product Price at the bottom right corner of the card
                        HProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
                      ],
                    )
                ],
              );
            }
        ),

      ),
    );
  }
}
