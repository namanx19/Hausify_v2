import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../firebase_storage_service.dart';

/// Repository for managing product-related data and operations.
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get Limited featured products

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
//     try {
// // Upload all the products along with their images
//       final storage = Get.put(HFirebaseStorageService());
//
// // Loop through each product
//       for (var product in products) {
// // Get image data link from local assets
//         final thumbnail = await storage.getImageDataFromAssets(
//             product.thumbnail);
//
// // Upload image and get its URL
//         final url = await storage.uploadImageData(
//             'Products/Images', thumbnail, product.thumbnail.toString());
//
// // Assign URL to product. thumbnail attribute
//         product.thumbnail = url;
//
// // Product List of images
//         if (product.images != null && product.images !.isNotEmpty) {
//           List<String> imagesUrl = [];
//           for (var image in product.images!) {
// // Get image data link from local assets
//             final assetImage = await storage.getImageDataFromAssets(image);
//
// // Upload image and get its URL
//             final url = await storage.uploadImageData(
//                 'Products/Images', assetImage, image);
//           }
//         }
      }

  getFeaturedProducts() {}}

