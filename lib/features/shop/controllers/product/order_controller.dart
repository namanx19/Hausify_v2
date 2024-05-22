import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/navigation_menu.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/order/order_repository.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../models/order_model.dart';
import 'cart_controller.dart';
import 'checkout_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      HLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    Razorpay razorpay = Razorpay();

    // Razorpay event handlers
    void handlePaymentSuccess(PaymentSuccessResponse response) async {
      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Clear cart
      cartController.clearCart();

      // Show Success screen
      Get.off(() => SuccessScreen(
        animation: HImages.orderCompletedAnimation,
        title: 'Payment Success!',
        subTitle: 'Your item will be shipped soon!',
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));
    }

    void handlePaymentError(PaymentFailureResponse response) {
      HLoaders.errorSnackBar(title: 'Payment Failed', message: response.message);
      HFullScreenLoader.stopLoading();
      Get.back();
    }


    try {
      // Start Loader
      HFullScreenLoader.openLoadingDialog('Processing your order.', HImages.pencilAnimation);

      // Initialize Razorpay
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);

      var options = {
        'key': 'rzp_test_roV8vALwgATa1a',
        'amount': totalAmount * 100, // Convert to paise
        'name': 'Hausify',
        'description': 'Order Payment',
        'prefill': {
          'contact': 'Naman Gupta',
          'email': 'naman.mw4@gmail.com'
        },
      };

      // Open Razorpay payment screen
      razorpay.open(options);

    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
