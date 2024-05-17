import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/shimmers/shimmer.dart';

import '../layout/grid_layout.dart';

class HBrandsShimmer extends StatelessWidget {
  const HBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return HGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const HShimmerEffect(width: 300, height: 80),
    );
  }
}
