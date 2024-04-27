import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/authentication/screens/signup/verify_email.dart';
import 'package:hausify_v2/features/authentication/screens/signup/widgets/terms_conditions_check.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
class HSignupForm extends StatelessWidget {
  const HSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          /// First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: HTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: HSizes.spaceBtwInputFields,),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: HTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Username
          TextFormField(
            decoration: const InputDecoration(
              labelText: HTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Email
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: HTexts.email,
              prefixIcon: Icon(Iconsax.sms),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Phone Number
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: HTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                labelText: HTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Terms and Conditions Checkbox
          const HTermsAndConditionsCheckbox(),
          const SizedBox(height: HSizes.spaceBtwSections,),

          /// Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(HTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

