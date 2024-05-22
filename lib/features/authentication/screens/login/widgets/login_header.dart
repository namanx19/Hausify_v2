import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
class HLoginHeader extends StatelessWidget {
  const HLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 120.0,
          //image: AssetImage(dark ? HImages.lightAppLogo : HImages.darkAppLogo),
          image: AssetImage(HImages.hausifyAppLogo),
        ),
        const SizedBox(height: HSizes.spaceBtwSections,),
        Text(
          HTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: HSizes.sm,
        ),
        Text(
          HTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}