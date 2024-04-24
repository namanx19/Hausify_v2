import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/login_signup/social_buttons.dart';
import 'package:hausify_v2/features/authentication/screens/signup/widgets/signup_form.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(HSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  HTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: HSizes.spaceBtwSections,
                ),

                // CTRL + ALT + L
                /// Form
                const HSignupForm(),
                const SizedBox(height: HSizes.spaceBtwSections,),

                /// Divider
                HFormDivider(dividerText: HTexts.orSignUpWith.capitalize!),
                const SizedBox(height: HSizes.spaceBtwSections,),


                /// Social Buttons
                const HSocialButtons(),
              ],
            ),
          ),
        ));
  }
}


