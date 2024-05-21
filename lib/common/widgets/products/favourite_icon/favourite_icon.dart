import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/h_circular_icon.dart';

class HFavouriteIcon extends StatelessWidget {
  const HFavouriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    final controller = Get.put(FavouritesController());
    return Obx(
      () => HCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? HColors.error : null,
        backgroundColor: dark ? Colors.black : HColors.light,
        onPressed: () => controller.toggleFavouriteProduct(productId),

        /// Change color of heart icon btn bg
      ),
    );
  }
}
