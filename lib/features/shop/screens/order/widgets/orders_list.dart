import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/features/shop/controllers/product/order_controller.dart';
import 'package:hausify_v2/utils/constants/colors.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';

class HOrderListItems extends StatelessWidget {
  const HOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = HHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing Found Widget
          final emptyWidget = HAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: HImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          /// Helper Function: Handle Loader, No Record, OR ERROR Message
          final response = HCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulations Record found.
          final orders = snapshot.data!;

          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(
              height: HSizes.spaceBtwItems,
            ),
            itemBuilder: (_, index) {
              final order = orders[index];
              return HRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? HColors.dark : HColors.light,
                padding: const EdgeInsets.all(HSizes.md),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Top Row
                    Row(
                      children: [
                        /// Icon
                        const Icon(Iconsax.ship),
                        const SizedBox(
                          width: HSizes.spaceBtwItems / 2,
                        ),

                        /// Status and Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge!.apply(color: HColors.primaryColor, fontWeightDelta: 1),
                              ),
                              Text(
                                order.formattedOrderDate,
                                style: Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                        ),

                        /// Icon
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.arrow_right_34,
                            size: HSizes.iconSm,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),

                    /// Row 2
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                              children: [
                                /// Icon
                                const Icon(Iconsax.tag),
                                const SizedBox(
                                  width: HSizes.spaceBtwItems / 2,
                                ),

                                /// Status and Date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                        Theme.of(context).textTheme.labelMedium,
                                      ),
                                      Text(
                                        order.id,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                        Theme.of(context).textTheme.titleMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                /// Icon
                                const Icon(Iconsax.calendar),
                                const SizedBox(
                                  width: HSizes.spaceBtwItems / 2,
                                ),

                                /// Status and Date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Shipping Date',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.labelMedium!,
                                      ),
                                      Text(
                                        order.formattedDeliveryDate,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              );
            }
          );
        });
  }
}
