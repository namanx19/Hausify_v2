import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class HTermsAndConditionsCheckbox extends StatelessWidget {
  const HTermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = HHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx( () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))
        ),
        const SizedBox(width: HSizes.spaceBtwItems,),

        /// #Modification5
        Expanded(
          child: Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: '${HTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: HTexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? HColors.white : HColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? HColors.white : HColors.primaryColor,
                  )),
                  TextSpan(text: ' ${HTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: HTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? HColors.white : HColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? HColors.white : HColors.primaryColor,
                  )),
                ]),
          ),
        )],
    );
  }
}