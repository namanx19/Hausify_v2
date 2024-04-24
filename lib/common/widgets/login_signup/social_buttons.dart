import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
class HLoginSocialButtons extends StatelessWidget {
  const HLoginSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: HColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: HSizes.iconMd,
              height: HSizes.iconMd,
              image: AssetImage(HImages.google),
            ),
          ),
        ),
        const SizedBox(width: HSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: HColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: HSizes.iconMd,
              height: HSizes.iconMd,
              image: AssetImage(HImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}