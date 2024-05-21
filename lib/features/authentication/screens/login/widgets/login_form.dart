import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/authentication/controllers/login/login_controller.dart';
import 'package:hausify_v2/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:hausify_v2/features/authentication/screens/signup/signup.dart';
import 'package:hausify_v2/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
class HLoginForm extends StatelessWidget {
  const HLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HSizes.spaceBtwSections),
        child: Column(
            children: [

              /// Input field for email
              TextFormField(
                controller: controller.email,
                validator: (value) => HValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: HTexts.email,
                ),
              ),
              const SizedBox(height: HSizes.spaceBtwInputFields,),

              /// Input Field for Password
              Obx(
                    () => TextFormField(
                  controller: controller.password,
                  validator: (value) => HValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: HTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))
                  ),
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
                      Obx( () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value
                        )
                      ),
                      const Text(HTexts.rememberMe),
                    ],
                  ),

                  /// Forgot Password
                  TextButton(onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                    child: const Text(HTexts.forgetPassword,),
                  ),

                ],
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(HTexts.signIn),)
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