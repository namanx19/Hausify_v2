import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hausify_v2/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:hausify_v2/routes/routes.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_review/product_reviews.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: HRoutes.home, page: () => const HomeScreen()),
    GetPage(name: HRoutes.store, page: () => const StoreScreen()),
    GetPage(name: HRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: HRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: HRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: HRoutes.order, page: () => const OrderScreen()),
    GetPage(name: HRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: HRoutes.cart, page: () => const CartScreen()),
    GetPage(name: HRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: HRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: HRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: HRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: HRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: HRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: HRoutes.onBoarding, page: () => const OnBoardingScreen()),

// Add more GetPage entries as needed
  ];
}
