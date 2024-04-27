import 'package:flutter/material.dart';
import 'package:hausify_v2/utils/devices/device_utility.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class HTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// if you want to add the background color to tabs you have to wrap them in Material widget.
  /// to do that we need [PreferredSized] Widget and that's why created custom class. [PreferredSizeWidget]
  const HTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? HColors.black : HColors.white,
      child: TabBar(
        tabs: tabs,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: HColors.primaryColor,
        labelColor: dark ? HColors.white : HColors.black,
        unselectedLabelColor: HColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HDeviceUtils.getAppBarHeight());
}
