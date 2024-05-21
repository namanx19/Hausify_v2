import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/shop/screens/product_details/product_detail.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key, required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // If the product have variations then show the product details for variation selection
        // Else add product to the cart
        if(product.productType == ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx (() {
        final productQuantityInCart = cartController.getProductQuantityInCart((product.id));
        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? HColors.primaryColor : HColors.dark, // Change Color of Add to cart Btn
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(HSizes.cardRadiusMd),
                  bottomRight: Radius.circular(HSizes.productImageRadius)
              )
          ),
          child: SizedBox(
            width: HSizes.iconLg * 1.2,
            height: HSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                    ? Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: HColors.white),)
                    : const Icon(Iconsax.add, color: HColors.white,)
              ),
            ),
          );
        }
      )
    );
  }
}