import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/personalization/screens/settings/settings.dart';
import 'package:hausify_v2/features/shop/screens/cart/cart.dart';
import 'package:hausify_v2/features/shop/screens/home/home.dart';
import 'package:hausify_v2/features/shop/screens/store/store.dart';
import 'package:hausify_v2/features/shop/screens/wishlist/wishlist.dart';
import 'package:iconsax/iconsax.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
          () => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) => controller.selectedIndex.value = index,
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
                NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
                NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
                NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
                NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: 'Cart'),
              ],
          ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
    const CartScreen(),
  ];
}
