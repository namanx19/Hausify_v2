import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constants/image_strings.dart';

/// A circular loader widget with customizable foreground and background colors.
class HLoaderAnimation extends StatelessWidget {
  const HLoaderAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(HImages.defaultLoaderAnimation, height: 200, width: 200));
  }
}