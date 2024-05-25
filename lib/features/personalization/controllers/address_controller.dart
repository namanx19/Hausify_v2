import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/loaders/circular_loader.dart';
import 'package:hausify_v2/data/repositories/address/address_repository.dart';
import 'package:hausify_v2/features/personalization/models/address_model.dart';
import 'package:hausify_v2/utils/popups/full_screen_loader.dart';
import 'package:hausify_v2/utils/popups/loaders.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/cloud_helper_functions.dart';
import '../../../utils/helpers/network_manager.dart';
import '../screens/address/add_new_address.dart';
import '../screens/address/widgets/single_address.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const HCircularLoader(),
      );

      // Clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the selected field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      selectedAddress.refresh();

      Get.back();
    } catch (e) {
      HLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

  Future addNewAddresses() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
          'Storing Address...', HImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      // Update selected address status
      address.id = id;
      selectedAddress(address);

      // Remove Loader
      HFullScreenLoader.stopLoading();

      // Show Success Message
      HLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.');

      // Refresh Address Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      HFullScreenLoader.stopLoading();
      HLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  // /// Show Addresses ModalBottomSheet at Checkout
  // Future<dynamic> selectNewAddressPopup(BuildContext context) {
  //   return showModalBottomSheet(
  //     context: context,
  //     builder: (_) => Container(
  //       padding: const EdgeInsets.all(HSizes.lg),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const HSectionHeading(text: 'Select Address', showActionButton: false),
  //           const SizedBox(height: HSizes.spaceBtwSections),
  //           FutureBuilder(
  //             future: getAllUserAddresses(),
  //             builder: (_, snapshot) {
  //               /// Helper Function: Handle Loader, No Record, OR ERROR Message
  //               final response = HCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
  //               if (response != null) return response;
  //
  //               return ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: snapshot.data!.length,
  //                 itemBuilder: (_, index) => HSingleAddress(
  //                   address: snapshot.data![index],
  //                   onTap: () async {
  //                     await selectAddress(snapshot.data![index]);
  //                     Get.back();
  //                   },
  //                 ),
  //               );
  //             },
  //           ), // FutureBuilder
  //           const SizedBox(height: HSizes.defaultSpace * 2),
  //           SizedBox(
  //             width: double.infinity,
  //             child: ElevatedButton(
  //                 onPressed: () => Get.to(() => const AddNewAddressScreen()),
  //                 child: const Text('Add new address')),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /// Show Addresses ModalBottomSheet at Checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HSectionHeading(text: 'Select Address', showActionButton: false),
              const SizedBox(height: HSizes.spaceBtwSections),
              FutureBuilder(
                future: getAllUserAddresses(),
                builder: (_, snapshot) {
                  /// Helper Function: Handle Loader, No Record, OR ERROR Message
                  final response = HCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (response != null) return response;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => HSingleAddress(
                      address: snapshot.data![index],
                      onTap: () async {
                        await selectAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ), // FutureBuilder
              const SizedBox(height: HSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddNewAddressScreen()),
                    child: const Text('Add new address')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Function to reset Form Fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
