import 'package:flutter/material.dart';
import 'package:hausify_v2/features/shop/controllers/product/cart_controller.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';

import '../../../../../utils/helpers/pricing_calculator.dart';

class HBillingAmountSection extends StatelessWidget {
  const HBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController=CartController.instance;
    final subTotal =cartController.totalCartPrice.value;

    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹$subTotal', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),

        /// Shipping Fees
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹${HPricingCalculator.calculateShippingCost(subTotal, 'IN')}', style: Theme.of(context). textTheme. labelLarge),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('GST', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹${HPricingCalculator.calculateTax(subTotal, 'IN')}', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('₹${HPricingCalculator.calculateTotalPrice(subTotal, 'IN')}', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),
      ],
    );
  }
}
