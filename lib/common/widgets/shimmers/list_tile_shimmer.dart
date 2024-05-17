import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class HListTileShimmer extends StatelessWidget {
  const HListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            HShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: HSizes.spaceBtwItems),
            Column(
              children: [
                HShimmerEffect(width: 100, height: 15),
                SizedBox(height: HSizes.spaceBtwItems / 2),
                HShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
