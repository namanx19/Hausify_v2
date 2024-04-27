import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/utils/constants/colors.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HBillingPaymentSection extends StatelessWidget {
  const HBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HSectionHeading(text: 'Payment Method', buttonTitle: 'Change', onPressed: (){},),
        const SizedBox(
          height: HSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            HRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? HColors.light : HColors.white,
              padding: const EdgeInsets.all(HSizes.sm),
              child: const Image(image: AssetImage(HImages.paypal), fit: BoxFit.contain,),
            ),
            const SizedBox(
              width: HSizes.spaceBtwItems / 2,
            ),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
