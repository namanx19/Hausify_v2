import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/list_tile/payment_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: HImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(HSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HSectionHeading(
                  text: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: HSizes.spaceBtwSections),
              HPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paypal', image: HImages.paypal)),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: HImages.googlePay)),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: HImages.applePay)),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'VISA', image: HImages.visa)),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Master Card', image: HImages.masterCard)),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'Paytm', image: HImages.paytm)),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              HPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Credit Card', image: HImages.creditCard)),
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              const SizedBox(height: HSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
