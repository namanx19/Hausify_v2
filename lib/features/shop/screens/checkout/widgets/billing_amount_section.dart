import 'package:flutter/material.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';

class HBillingAmountSection extends StatelessWidget {
  const HBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs. 2999', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),

        /// Shipping Fees
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs. 49', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('GST', style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs. 149', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs. 3499', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),
      ],
    );
  }
}
