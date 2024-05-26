// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../features/shop/controllers/product/checkout_controller.dart';
// import '../../../features/shop/models/payment_method_model.dart';
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/sizes.dart';
// import '../../../utils/helpers/helper_functions.dart';
// import '../custom_shapes/containers/rounded_container.dart';
//
// class HPaymentTile extends StatelessWidget {
//   const HPaymentTile({super.key, required this.paymentMethod});
//
//   final PaymentMethodModel paymentMethod;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = CheckoutController.instance;
//     return ListTile(
//       contentPadding: const EdgeInsets.all(0),
//       onTap: () {
//         controller.selectedPaymentMethod.value = paymentMethod;
//         Get.back();
//       },
//       leading: HRoundedContainer(
//         width: 60,
//         height: 40,
//         backgroundColor: HHelperFunctions.isDarkMode(context)
//             ? HColors.light
//             : HColors.white,
//         padding: const EdgeInsets.all(HSizes.sm),
//         child:
//             Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
//       ),
//       // TRoundedContainer
//       title: Text(paymentMethod.name),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             paymentMethod.isAvailable,
//             style: Theme.of(context).textTheme.bodySmall!.apply(
//               color: paymentMethod.isAvailable == 'Available'
//                   ? Colors.green
//                   : Colors.red,
//             ),
//           ),
//           const SizedBox(width: HSizes.spaceBtwItems),
//           const Icon(Iconsax.arrow_right_34),
//         ],
//       ),
//     );
//   }
// }



// Refined
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/shop/controllers/product/checkout_controller.dart';
import '../../../features/shop/models/payment_method_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';

class HPaymentTile extends StatelessWidget {
  const HPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    final bool isAvailable = paymentMethod.isAvailable == 'Available';
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: isAvailable ? () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      } : null,
      leading: HRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: HColors.light,
        padding: const EdgeInsets.all(HSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            paymentMethod.isAvailable,
            style: Theme.of(context).textTheme.bodySmall!.apply(
              color: isAvailable ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: HSizes.spaceBtwItems),
          const Icon(Iconsax.arrow_right_34),
        ],
      ),
    );
  }
}




