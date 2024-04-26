import 'package:flutter/material.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:hausify_v2/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            HProductImageSlider(),

             /// Product Details
             Padding(
                 padding: EdgeInsets.only(right: HSizes.defaultSpace,left: HSizes.defaultSpace, bottom: HSizes.defaultSpace),
               child: Column(
                 children: [
                   /// Rating and Share Button
                   HRatingAndShare(),

                   /// Price, Title, Stock and Brand
                   HProductMetaData()
                 ],
               ),
             )
          ],
        ),
      ),
    );
  }
}




