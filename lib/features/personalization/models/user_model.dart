

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hausify_v2/utils/formatters/formatter.dart';

/// Model class representing user data
class UserModel {
  // Keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;


  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,

});

  /// Helper functions to get the full name
  String get fullName => '$firstName $lastName';


  /// Helper functions to get the formatted phone number
  String get formattedPhoneNo => HFormatter.formatPhoneNumber(phoneNumber);


  /// Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");


  /// Static function to generate a username from full name
  static String generateUsername(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : " ";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "hausify_$camelCaseUsername";
    return usernameWithPrefix;
  }


  /// Static function to create an empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

  /// Convert model to JSON structure for storing data in firebase
  Map<String, dynamic> toJson(){
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create user model from a firebase document snapshot
  /// Video 35 --
  /// Video 38 -- 24:04 mins
  /// The else part is written using GPT
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        email: data['Email'] ?? '',
        username: data['Username'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
      );
    } else {
      return UserModel.empty(); // Returning an empty UserModel when document data is null
    }
  }
}