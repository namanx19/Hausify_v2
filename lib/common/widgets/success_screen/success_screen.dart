import 'package:flutter/material.dart';
import 'package:hausify_v2/common/styles/spacing_style.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    this.image,
    required this.title,
    required this.subTitle,
    this.onPressed,
    this.animation,
    this.height,
    this.width
  });

  final String? image;
  final String? animation;
  final String title;
  final String subTitle;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              if (animation != null && image == null)
                Lottie.asset(
                  animation!,
                  height: height ?? MediaQuery.of(context).size.height * 0.5,
                  width: width,
                ),
              if (image != null && animation == null)
                Image.asset(
                  image!,
                  width: HHelperFunctions.screenWidth() * 0.6,
                ),
              const SizedBox(height: HSizes.spaceBtwSections,),

              /// Title and SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: HSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(HTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
