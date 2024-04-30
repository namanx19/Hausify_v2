
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/data/repositories/authentication/authentication_repository.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  /// Send reset password email
  sendPasswordResetEmail() async {
    try{
      /// Start Loading
      HFullScreenLoader.openLoadingDialog(
          'Processing your request...', HImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      /// Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Show success screen
      HLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);

      /// Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Show some Generic Error to the user
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try{
      /// Start Loading
      HFullScreenLoader.openLoadingDialog(
          'Processing your request...', HImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      /// Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Show success screen
      HLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);


    } catch (e) {
      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Show some Generic Error to the user
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}