import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/data/repositories/user/user_repository.dart';
import 'package:hausify_v2/utils/popups/loaders.dart';
import '../models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user records
  Future<void> fetchUserRecord() async {
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecords(UserCredential? userCredentials) async {
    try {
      if(userCredentials != null){
        /// Convert Name to first and last name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        /// Map Data
        final user = UserModel (
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',

        );

        /// Save user data
        await userRepository.saveUserRecords(user);
      }
    } catch (e) {
      HLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information. You can re-save your data in your profile',
      );
    }
  }
}