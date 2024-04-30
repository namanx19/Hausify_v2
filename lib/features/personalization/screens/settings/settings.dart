import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:hausify_v2/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/data/repositories/authentication/authentication_repository.dart';
import 'package:hausify_v2/features/personalization/screens/address/address.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../shop/screens/order/order.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            HPrimaryHeaderContainer(
                child: Column(
                children: [
                /// Appbar
                HAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: HColors.white),
                  ),
                ),

                /// User Profile Card
                const HUserProfileTile(),
                const SizedBox(
                  height: HSizes.spaceBtwSections,
                ),
              ],
            )),

            /// Body
            Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Setting Heading
                  const HSectionHeading(
                    text: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwItems,
                  ),

                  /// Account Settings List
                  HSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () {},
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'My Wallet',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all discount coupons',
                    onTap: () {},
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSections,
                  ),

                  /// App Settings Header
                  const HSectionHeading(
                    text: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwItems,
                  ),

                  /// App Settings List
                  HSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload data to your cloud firebase account',
                    onTap: () {},
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendations based on location',
                    onTap: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    onTap: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  HSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD image quality',
                    subTitle: 'Set image quality to be seen',
                    onTap: () {},
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  /// Logout Button
                  const SizedBox(
                    height: HSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.red, // Change this color to your desired border color
                          width: 2, // Change this width to your desired border width
                        ),
                      ),
                      onPressed: () => AuthenticationRepository.instance.logout(), /// #Modification6
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: HSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
