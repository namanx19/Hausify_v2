import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/shop/controllers/product/cart_controller.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';

class HCartCounterIcon extends StatelessWidget {
  const HCartCounterIcon({
    super.key, this.iconColor, this.counterBgColor, this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = HHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()) , icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? HColors.white : HColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
          () => Text(
                  controller.noOfCartItems.value.toString(),
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: counterTextColor ?? (dark ? HColors.black : HColors.white),
                                fontSizeFactor: 0.8
                        ),
                    ),
                ),
            ),
          ),
        )
      ],
    );
  }
}
