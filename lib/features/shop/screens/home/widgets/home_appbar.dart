import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/personalization/controllers/user_controller.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

/// AppBar for the Home Screen
class HHomeAppBar extends StatelessWidget {
  const HHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return HAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(HTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: HColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const HShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: HColors.white));
            }
          }),
        ],
      ),
      actions: const [
        HCartCounterIcon(
          iconColor: HColors.white,
          counterBgColor: HColors.black,
          counterTextColor: HColors.white,
        )
      ],
    );
  }
}
