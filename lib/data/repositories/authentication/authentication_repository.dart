import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hausify_v2/features/authentication/screens/login/login.dart';
import 'package:hausify_v2/features/authentication/screens/onboarding/onboarding.dart';
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
    // Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    
    deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen()); 
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

}