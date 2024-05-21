import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/common/widgets/success_screen/success_screen.dart';
import 'package:hausify_v2/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:hausify_v2/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:hausify_v2/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:hausify_v2/navigation_menu.dart';
import 'package:hausify_v2/utils/constants/colors.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import 'package:hausify_v2/utils/popups/loaders.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = HPricingCalculator.calculateTotalPrice(subTotal, 'IN');

    final dark = HHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: HAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in cart
              const HCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: HSizes.spaceBtwSections,
              ),

              /// Coupon TextField
              const HCouponCode(),
              const SizedBox(
                height: HSizes.spaceBtwSections,
              ),

              /// Billing Section
              HRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(HSizes.md),
                backgroundColor: dark ? HColors.black : HColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    HBillingAmountSection(),
                    SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),

                    /// Payment Methods
                    HBillingPaymentSection(),
                    SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),


                    /// Address
                    HBillingAddressSection(),
                    SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),


      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0 ?
          () => orderController.processOrder(totalAmount)
          : () => HLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed.'),
          child: Text('Checkout ₹$totalAmount'),
        ),
      ),
    );
  }
}


