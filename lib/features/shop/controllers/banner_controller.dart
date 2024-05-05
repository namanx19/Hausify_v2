import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hausify_v2/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{

  /// Variables
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners =<BannerModel>[].obs;

  /// Update Page Navigational Dots
  void updatePageIndicator(index){
    carousalCurrentIndex.value =index;
  }


  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;


} catch (e) {
      HLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value=false;
    }
  }


}
