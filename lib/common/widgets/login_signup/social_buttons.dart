import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class HSocialButtons extends StatelessWidget {
  const HSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: HColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
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