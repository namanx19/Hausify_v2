import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hausify_v2/features/authentication/screens/login/login.dart';
import 'package:hausify_v2/features/authentication/screens/onboarding/onboarding.dart';
import 'package:hausify_v2/features/authentication/screens/signup/verify_email.dart';
import 'package:hausify_v2/navigation_menu.dart';
import 'package:hausify_v2/utils/exceptions/firebase_exceptions.dart';
import 'package:hausify_v2/utils/exceptions/format_exceptions.dart';
import 'package:hausify_v2/utils/exceptions/platform_exceptions.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  
  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  
  /// Called from main.dart on app launch
  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  
  /// Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      // Check if the app is launched for the first time
      deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
    }

  }


  /*----------------------------- Email & Password Sign In -----------------------------*/

  /// [EmailAuthentication] - Signin


  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const HFormatException();
    } on PlatformException catch (e){
      throw HPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [EmailVerification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const HFormatException();
    } on PlatformException catch (e){
      throw HPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailAuthentication] - Forget Password


  /*---------------------------- Federated identity and Social Sign in ----------------------------*/

  /// [GoogleAuthentication] - Google


  /// [FacebookAuthentication] - Facebook


  /*---------------------------- Federated identity and Social Sign in ----------------------------*/

  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw HFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const HFormatException();
    } on PlatformException catch (e){
      throw HPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [DeleteUser] - Remove user Auth and Firestore Account

}