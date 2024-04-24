import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:hausify_v2/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:hausify_v2/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:hausify_v2/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:hausify_v2/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import 'package:hausify_v2/utils/constants/text_strings.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: HImages.onBoardingImage1,
                title: HTexts.onBoardingTitle1,
                subTitle: HTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: HImages.onBoardingImage2,
                title: HTexts.onBoardingTitle2,
                subTitle: HTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: HImages.onBoardingImage3,
                title: HTexts.onBoardingTitle3,
                subTitle: HTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          
          /// Skip Button
          const OnBoardingSkipButton(),

          /// Dot Navigation Smooth Page Indicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}








