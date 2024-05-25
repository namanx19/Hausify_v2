// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
// import 'package:hausify_v2/features/personalization/controllers/address_controller.dart';
// import 'package:hausify_v2/utils/constants/sizes.dart';
//
// class HBillingAddressSection extends StatelessWidget {
//   const HBillingAddressSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final addressController = Get.put(AddressController());
//     return Obx(
//       () => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           HSectionHeading(
//             text: 'Shipping Address',
//             buttonTitle: 'Change',
//             onPressed: () => addressController.selectNewAddressPopup(context),
//           ),
//           addressController.selectedAddress.value.id.isNotEmpty
//               ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Naman Gupta',
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     ),
//                     const SizedBox(
//                       height: HSizes.spaceBtwItems / 2,
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.phone,
//                           color: Colors.grey,
//                           size: 16,
//                         ),
//                         const SizedBox(
//                           width: HSizes.spaceBtwItems,
//                         ),
//                         Text(
//                           '+91 9455241118',
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: HSizes.spaceBtwItems / 2,
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.location_history,
//                           color: Colors.grey,
//                           size: 16,
//                         ),
//                         const SizedBox(
//                           width: HSizes.spaceBtwItems,
//                         ),
//                         Expanded(
//                           child: Text(
//                             'Power House Road, Mohaddipur, Gorakhpur - 273008',
//                             style: Theme.of(context).textTheme.bodyMedium,
//                             softWrap: true,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//               : Text(
//                   'Select Address',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//           const SizedBox(
//             height: HSizes.spaceBtwItems / 2,
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/personalization/controllers/address_controller.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';

class HBillingAddressSection extends StatelessWidget {
  const HBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    return Obx(
          () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HSectionHeading(
            text: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () => addressController.selectNewAddressPopup(context),
          ),
          addressController.selectedAddress.value.id.isNotEmpty
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addressController.selectedAddress.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems / 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  Text(
                    addressController.selectedAddress.value.phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems / 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_history,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  Expanded(
                    child: Text(
                      '${addressController.selectedAddress.value.street}, '
                          '${addressController.selectedAddress.value.city}, '
                          '${addressController.selectedAddress.value.state} - '
                          '${addressController.selectedAddress.value.postalCode}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          )
              : Text(
            'Select Address',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: HSizes.spaceBtwItems / 2,
          ),
        ],
      ),
    );
  }
}