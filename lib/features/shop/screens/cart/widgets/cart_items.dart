import 'package:flutter/material.dart';
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
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: HSizes.spaceBtwSections,),
      itemBuilder: (_, index) => Column(
        children: [
          const HCartItem(),

          if(showAddRemoveButtons) const SizedBox(height: HSizes.spaceBtwItems,),

          if(showAddRemoveButtons)
            const Row(
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

    );
  }
}
