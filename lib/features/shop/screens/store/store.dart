import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/appbar/tabbar.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:hausify_v2/common/widgets/layout/grid_layout.dart';
import 'package:hausify_v2/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/shop/screens/store/widgets/category_tab.dart';
import 'package:hausify_v2/utils/constants/enums.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../common/widgets/images/h_circular_image.dart';
import '../../../../common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        /// -- Appbar
        appBar: HAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            HCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          /// -- Header

          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: HHelperFunctions.isDarkMode(context)
                    ? HColors.black
                    : HColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(HSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      const SizedBox(height: HSizes.spaceBtwItems),
                      const HSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: HSizes.spaceBtwItems),

                      /// -- Featured Brands
                      HSectionHeading(text: 'Feature Brands', onPressed: () {}),
                      const SizedBox(height: HSizes.spaceBtwItems / 1.5),

                      HGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const HBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                /// -- Tabs
                bottom: const HTabBar(tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Furniture')),
                  Tab(child: Text('Electronics')),
                  Tab(child: Text('Clothes')),
                  Tab(child: Text('Cosmetics')),
                ]),
              ),
            ];
          },

          /// -- Body
          body: const TabBarView(
            children: [
              HCategoryTab(),
              HCategoryTab(),
              HCategoryTab(),
              HCategoryTab(),
              HCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
