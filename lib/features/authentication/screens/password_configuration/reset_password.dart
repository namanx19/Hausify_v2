import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:hausify_v2/features/authentication/screens/login/login.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(HImages.deliveredEmailIllustration), width: HHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: HSizes.spaceBtwSections,),

              /// Email, Title and SubTitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              Text(
                HTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              Text(
                HTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: HSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text(HTexts.done),),
              ),
              const SizedBox(height: HSizes.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(HTexts.resendEmail),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
