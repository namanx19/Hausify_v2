import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hausify_v2/data/repositories/authentication/authentication_repository.dart';
import 'package:hausify_v2/features/personalization/controllers/user_controller.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController{

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit(){
    super.onInit();

    /// #Modification7
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
  }

  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// Start Loading
      HFullScreenLoader.openLoadingDialog('Logging you in...', HImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      /// Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      /// Login user using email and password authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    }  catch (e) {
      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Show some Generic Error to the user
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


  /// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try{
      /// Start Loading
      HFullScreenLoader.openLoadingDialog('Logging you in...', HImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      /// Google authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      /// Save user records
      await userController.saveUserRecords(userCredentials);

      /// Remove Loader
      HFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      /// Remove Loader
      HFullScreenLoader.stopLoading();
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
