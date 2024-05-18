import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class HHorizontalProductShimmer extends StatelessWidget {
  const HHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: HSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            const SizedBox(width: HSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            HShimmerEffect(width: 120, height: 120),
            SizedBox(width: HSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: HSizes.spaceBtwItems / 2),
                HShimmerEffect(width: 160, height: 15),
                SizedBox(height: HSizes.spaceBtwItems / 2),
                HShimmerEffect(width: 110, height: 15),
                SizedBox(height: HSizes.spaceBtwItems / 2),
                HShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
