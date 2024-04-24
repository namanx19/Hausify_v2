import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/styles/spacing_style.dart';
import 'package:hausify_v2/features/authentication/screens/login/widgets/login_form.dart';
import 'package:hausify_v2/features/authentication/screens/login/widgets/login_header.dart';
import 'package:hausify_v2/utils/constants/text_strings.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [

              /// Logo Title and Subtitle
              const HLoginHeader(),

              ///  Login Form
              const HLoginForm(),


              /// Divider
              HFormDivider(dividerText: HTexts.orSignInWith.capitalize!,),
              const SizedBox(height: HSizes.spaceBtwSections,),


              /// Footer
              const HLoginSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}








