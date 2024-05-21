import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class HCouponCode extends StatelessWidget {
  const HCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return HRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? HColors.dark : HColors.white,
      padding: const EdgeInsets.only(
          top: HSizes.sm,
          bottom: HSizes.sm,
          right: HSizes.sm,
          left: HSizes.md
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Apply Here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark ? HColors.white.withOpacity(0.5) : HColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1))
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}