import 'package:flutter/material.dart';
import 'package:hausify_v2/utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class HPrimaryHeaderContainer extends StatelessWidget {
  const HPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HCurvedEdgesWidget(
      child: SizedBox(
        height: 400,
      child: Container(
        color: HColors.primaryColor,

        /// If ['size.isFinite': is not true.in Stack] error occured -> Read README.md file
        child: Stack(
          children: [

            /// Background Custom Shapes
            Positioned(
                top: -150,
                right: -250,
                child: HCircularContainer(
                    backgroundColor: HColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: HCircularContainer(
                    backgroundColor: HColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    ),
    );
  }
}
