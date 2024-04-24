import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                  TextButton(onPressed: () {},
                    child: const Text(HTexts.forgetPassword,),
                  ),

                ],
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: const Text(HTexts.signIn),)
              ),
              const SizedBox(height: HSizes.spaceBtwItems,),


              /// Create Account Button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: (){}, child: const Text(HTexts.createAccount),)
              ),
            ]
        ),
      ),
    );
  }
}