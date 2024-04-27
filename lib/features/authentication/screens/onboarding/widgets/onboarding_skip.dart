import 'package:flutter/material.dart';
import 'package:hausify_v2/features/authentication/controllers/onboarding/onboarding_controller.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/device_utility.dart';

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
          child: const Text(
            'Skip',
          ),
        ));
  }
}