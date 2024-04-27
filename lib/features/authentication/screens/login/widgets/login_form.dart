import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:hausify_v2/features/authentication/screens/signup/signup.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
class HLoginForm extends StatelessWidget {
  const HLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HSizes.spaceBtwSections),
        child: Column(
            children: [

              /// Input field for email
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: HTexts.email,
                ),
              ),
              const SizedBox(height: HSizes.spaceBtwInputFields,),

              /// Input Field for Password
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: HTexts.password,
                    suffixIcon: Icon(Iconsax.eye_slash)
                ),
              ),
              const SizedBox(height: HSizes.spaceBtwInputFields / 2,),

              /// Remember me and Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Remember Me
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value){}),
                      const Text(HTexts.rememberMe),
                    ],
                  ),

                  /// Forgot Password
                  TextButton(onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(HTexts.forgetPassword,),
                  ),

                ],
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(HTexts.signIn),)
              ),
              const SizedBox(height: HSizes.spaceBtwItems,),


              /// Create Account Button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(HTexts.createAccount),)
              ),
            ]
        ),
      ),
    );
  }
}