import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/h_circular_icon.dart';

class HProductQuantityWithAddRemoveButton extends StatelessWidget {
  const HProductQuantityWithAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: HSizes.md,
          color: dark ? HColors.white : HColors.black,
          backgroundColor: dark ? HColors.darkerGrey : HColors.light,
          onPressed: remove,
        ),

        const SizedBox(width: HSizes.spaceBtwItems,),

        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),

        const SizedBox(width: HSizes.spaceBtwItems,),


        HCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: HSizes.md,
          color: HColors.white,
          backgroundColor: HColors.primaryColor,
          onPressed: add,
        ),

      ],
    );
  }
}