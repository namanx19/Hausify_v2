import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import '../../../../utils/constants/colors.dart';

class HRatingBarIndicator extends StatelessWidget {
  const HRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
            rating: rating,
            itemSize: 20,
            unratedColor: HColors.grey,
            itemBuilder: (_, __) =>
            /// #Issue12
            /// Iconsax.star <-> Icons.star_rate_rounded
            const Icon(Icons.star_rate_rounded, color: HColors.primaryColor,),
        ),
        const SizedBox(width: HSizes.spaceBtwItems / 2,)
      ],
    );
  }
}
