import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/success_screen/success_screen.dart';
import 'package:hausify_v2/data/repositories/authentication/authentication_repository.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import 'package:hausify_v2/utils/constants/text_strings.dart';
import 'package:hausify_v2/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send email verification link
  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      HLoaders.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email.');
    } catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


  /// Timer to automatically redirect on email verification
  setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
       final user = FirebaseAuth.instance.currentUser;
       if(user?.emailVerified ?? false) {
         timer.cancel();
         Get.off(() => SuccessScreen(
             image: HImages.successfullyRegisterAnimation,
             title: HTexts.yourAccountCreatedTitle,
             subTitle: HTexts.yourAccountCreatedSubTitle,
           onPressed: () => AuthenticationRepository.instance.screenRedirect(),
         ));
       }
    });
  }


  /// Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
        image: HImages.successfullyRegisterAnimation, /// #Issue14
        title: HTexts.yourAccountCreatedTitle,
        subTitle: HTexts.yourAccountCreatedSubTitle,
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }


}