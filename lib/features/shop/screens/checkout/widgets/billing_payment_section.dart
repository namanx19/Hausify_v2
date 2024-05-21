import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/shop/models/payment_method_model.dart';
import 'package:hausify_v2/utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/checkout_controller.dart';

class HBillingPaymentSection extends StatelessWidget {
  const HBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
   final dark = HHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HSectionHeading(text: 'Payment Method', buttonTitle: 'Change', onPressed: ()=>controller.selectPaymentMethod(context)),
        const SizedBox(
          height: HSizes.spaceBtwItems / 2,
        ),
        Obx(
          ()=> Row(
            children: [
              HRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? HColors.light : HColors.white,
                padding: const EdgeInsets.all(HSizes.sm),
                child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain,),
              ),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge,)
            ],
          ),
        )
      ],
    );
  }
}
