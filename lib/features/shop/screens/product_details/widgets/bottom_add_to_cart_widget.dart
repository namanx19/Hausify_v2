import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hausify_v2/features/shop/controllers/product/cart_controller.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/icons/h_circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class HBottomAddToCart extends StatelessWidget {
  const HBottomAddToCart({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = HHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: HSizes.defaultSpace, vertical: HSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? HColors.darkerGrey : HColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(HSizes.cardRadiusLg),
            topRight: Radius.circular(HSizes.cardRadiusLg),
          )),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                 HCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: HColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: HColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: HSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context). textTheme. titleSmall),
                const SizedBox(width: HSizes.spaceBtwItems),
                HCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: HColors.black,
                  width: 40,
                  height: 40,
                  color: HColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
        
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(HSizes.md),
                backgroundColor: HColors.black,
                side: const BorderSide(color: HColors.black),
              ),
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
