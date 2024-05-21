import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/authentication/controllers/signup/signup_controller.dart';
import 'package:hausify_v2/features/authentication/screens/signup/widgets/terms_conditions_check.dart';
import 'package:hausify_v2/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class HSignupForm extends StatelessWidget {
  const HSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [

          /// First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => HValidator.validateEmptyText('First Name', value),
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
                  controller: controller.lastName,
                  validator: (value) => HValidator.validateEmptyText('Last Name', value),
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
            controller: controller.username,
            validator: (value) => HValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
              labelText: HTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => HValidator.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: HTexts.email,
              prefixIcon: Icon(Iconsax.sms),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => HValidator.validatePhoneNumber(value),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: HTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Password
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
          const SizedBox(height: HSizes.spaceBtwInputFields,),

          /// Terms and Conditions Checkbox
          const HTermsAndConditionsCheckbox(),
          const SizedBox(height: HSizes.spaceBtwSections,),

          /// Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(HTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

