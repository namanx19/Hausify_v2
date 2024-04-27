import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/chips/choice_chip.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/common/widgets/texts/product_price_text.dart';
import 'package:hausify_v2/common/widgets/texts/product_title_text.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HProductAttributes extends StatelessWidget {
  const HProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HRoundedContainer(
          padding: const EdgeInsets.all(HSizes.md),
          backgroundColor: dark ? HColors.darkerGrey : HColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Status
              Row(
                children: [
                  const HSectionHeading(
                      text: 'Variation', showActionButton: false),
                  const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const HProductTitleText(
                              title: 'Price :', smallSize: true),

                          /// we can either remove the extra space or keep it if needed
                          ///const SizedBox(width: HSizes.spaceBtwItems),

                          /// Actual Price
                          Text(
                            '\₹25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(width: HSizes.spaceBtwItems),

                          /// Sale Price

                          const HProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const HProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const HProductTitleText(
                title:
                    'This is the Description of the product and it can got up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),

        const SizedBox(
          height: HSizes.spaceBtwItems,
        ),

        /// -- Attributes
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSectionHeading(text: 'Colors', showActionButton: false),
            const SizedBox(height: HSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                HChoiceChip(text: 'Green', selected: false, onSelected: (value){}),
                HChoiceChip(text: 'Blue', selected: true,onSelected: (value){}),
                HChoiceChip(text: 'Yellow', selected: false,onSelected: (value){}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSectionHeading(text: 'Size', showActionButton: false),
            const SizedBox(height: HSizes.spaceBtwItems / 2),

            Wrap(
              /// Issue10
              spacing: 6,
              children: [
                HChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
                HChoiceChip(text: 'EU 36', selected: false, onSelected: (value){}),
                HChoiceChip(text: 'EU 38', selected: false, onSelected: (value){}),
                HChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
                HChoiceChip(text: 'EU 36', selected: false, onSelected: (value){}),
                HChoiceChip(text: 'EU 38', selected: false, onSelected: (value){}),
                HChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
                HChoiceChip(text: 'EU 36', selected: false, onSelected: (value){}),
              ],
            ),


          ],
        ),
      ],
    );
  }
}
