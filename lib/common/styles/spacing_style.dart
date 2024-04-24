import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class HSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: HSizes.appBarHeight,
    left: HSizes.defaultSpace,
    bottom: HSizes.defaultSpace,
    right: HSizes.defaultSpace,
  );
}