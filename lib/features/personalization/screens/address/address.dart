import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/features/personalization/screens/address/add_new_address.dart';
import 'package:hausify_v2/features/personalization/screens/address/widgets/single_address.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HColors.primaryColor,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: HColors.white),

      ),
      appBar: HAppBar(
        showBackArrow: true,
        title: Text('My Address', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          children: [


            HSingleAddress(selectedAddress: false),
            HSingleAddress(selectedAddress: true)

          ],
        ),
        ),
      ),
    );
  }
}
