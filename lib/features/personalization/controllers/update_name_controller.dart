import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/data/repositories/user/user_repository.dart';
import 'package:hausify_v2/features/personalization/controllers/user_controller.dart';
import 'package:hausify_v2/features/personalization/screens/profile/profile.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import 'package:hausify_v2/utils/popups/full_screen_loader.dart';
import 'package:hausify_v2/utils/popups/loaders.dart';
import '../../../utils/helpers/network_manager.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      /// Start loading
      HFullScreenLoader.openLoadingDialog(
          'We are updating your information...', HImages.docerAnimation);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      /// Update user's first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      /// Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Show success messsage
      HLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated');

      /// Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      HFullScreenLoader.stopLoading();
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}