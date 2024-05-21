import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/shimmers/shimmer.dart';
import '../../../utils/constants/sizes.dart';
import '../layout/grid_layout.dart';

class HVerticalProductShimmer extends StatelessWidget {
  const HVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return HGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            HShimmerEffect(width: 180, height: 180),
            SizedBox(height: HSizes.spaceBtwItems),

            /// Text
            HShimmerEffect(width: 160, height: 15),
            SizedBox(height: HSizes.spaceBtwItems / 2),
            HShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
