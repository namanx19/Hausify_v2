import 'package:flutter/material.dart';
import 'package:hausify_v2/features/shop/models/cart_item_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/h_rounded_image.dart';
import '../../texts/h_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

/// HCartItem class is for creating Single Cart Item Card
/// HCartItems class is for creating a list of Cart Items

class HCartItem extends StatelessWidget {
  const HCartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        HRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(HSizes.sm),
          backgroundColor: dark ? HColors.darkerGrey : HColors.light,
        ),
        const SizedBox(width: HSizes.spaceBtwItems,),

        /// Title, Price and Size
        Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
                Flexible(
                  child: HProductTitleText(title: cartItem.title, maxLines: 1,),),
                Text.rich(
                    TextSpan(
                      children: (cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(
                        children: [
                          TextSpan(text: ' ${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                      ],),).toList(),
                    )
                )
              ],
            )
        )
      ],
    );
  }
}