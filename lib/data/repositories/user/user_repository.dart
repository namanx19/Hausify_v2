

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// Function to save user data to Firestore
  Future<void> saveUserRecords(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
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


  /// Function to fetch user details based on user ID


  /// Function to update user data on Firestore


  /// Update any field in specific user collection
}