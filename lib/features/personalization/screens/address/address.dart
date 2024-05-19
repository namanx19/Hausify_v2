import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/features/personalization/controllers/address_controller.dart';
import 'package:hausify_v2/features/personalization/screens/address/add_new_address.dart';
import 'package:hausify_v2/features/personalization/screens/address/widgets/single_address.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: HAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Obx(
              () => FutureBuilder(
              // Use Key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {

                // Helper Functions: Handle Loader, No Record or Error Message
                final response = HCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,);
                if(response != null) return response;

                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) {
                    return HSingleAddress(address: addresses[index],
                      onTap: () => controller.selectAddress(addresses[index]),
                    );
                  }
                );
              }
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HColors.primaryColor,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: HColors.white),
      ),
    );
  }
}
