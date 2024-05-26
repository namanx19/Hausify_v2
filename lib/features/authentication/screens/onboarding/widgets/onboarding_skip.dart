import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/authentication/screens/login/login.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: HDeviceUtils.getAppBarHeight(),
        right: HSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          //onPressed: () => Get.to(const LoginScreen()),
          child: const Text(
            'Skip',
          ),
        )
    );
  }
}