import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/data/repositories/authentication/authentication_repository.dart';
import 'package:hausify_v2/data/repositories/user/user_repository.dart';
import 'package:hausify_v2/features/authentication/screens/signup/verify_email.dart';
import 'package:hausify_v2/utils/popups/full_screen_loader.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final email = TextEditingController(); // Controller for email input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  final password = TextEditingController(); // Controller for password input

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form Key for form validation

  /// Sign Up

  void signup() async {
    try {
        /// Start Loading
        HFullScreenLoader.openLoadingDialog('We are processing your information...', HImages.docerAnimation);

        /// Check Internet Connectivity
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          HFullScreenLoader.stopLoading();
          return;
        }

        /// Form Validation
        if (!signupFormKey.currentState!.validate()) {
          HFullScreenLoader.stopLoading();
          return;
        }

        /// Privacy Policy Check
        if (!privacyPolicy.value) {
          HLoaders.warningSnackBar(
              title: 'Accept Privacy Policy',
              message:
              'In order to create account, you must have to read and accept the Privacy Policy and Terms of Use.');
          HFullScreenLoader.stopLoading(); /// #Issue13
          return;
        }

        /// Register user in the Firebase Authentication & Save user data in the Firebase
        final userCredential = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(
            email.text.trim(), password.text.trim());

        /// Save Authenticated user data in the Firebase Firestore
        final newUser = UserModel(
            id: userCredential.user!.uid,
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            username: username.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            profilePicture: ''
        );

        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecords(newUser);

        /// Remove Loader
        HFullScreenLoader.stopLoading();

        /// Show success message
        HLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your account has been created! Verify email to continue.'
        );

        /// Move to verify Email Screen
        Get.to(() => const VerifyEmailScreen());
      } catch (e) {
      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Show some Generic Error to the user
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
