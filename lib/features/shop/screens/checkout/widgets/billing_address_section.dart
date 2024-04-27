import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';


class HBillingAddressSection extends StatelessWidget {
  const HBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HSectionHeading(text: 'Shipping Address', buttonTitle: 'Change', onPressed: (){},),
        Text('Naman Gupta', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: HSizes.spaceBtwItems,),
            Text('+91 1234567890', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: HSizes.spaceBtwItems,),
            Expanded(child: Text('South Liana, Maine 58769 USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,),),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2,),
      ],
    );
  }
}
