import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/shimmers/shimmer.dart';
import '../../../utils/constants/sizes.dart';

class HBoxesShimmer extends StatelessWidget {
  const HBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: HShimmerEffect(width: 150, height: 110)),
            SizedBox(width: HSizes.spaceBtwItems),
            Expanded(child: HShimmerEffect(width: 150, height: 110)),
            SizedBox(width: HSizes.spaceBtwItems),
            Expanded(child: HShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
