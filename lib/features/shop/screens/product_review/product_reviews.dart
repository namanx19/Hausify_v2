import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hausify_v2/features/shop/screens/product_review/widgets/progress_indicator_and_rating.dart';
import 'package:hausify_v2/features/shop/screens/product_review/widgets/rating_progress_indicator.dart';
import 'package:hausify_v2/features/shop/screens/product_review/widgets/user_review_card.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/devices/device_utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar:
          const HAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: HSizes.spaceBtwItems),

              /// Overall Product Ratings

              const HOverallProductRating(),
              const HRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: HSizes.spaceBtwItems),

              /// User Review List

              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    );
  }
}
