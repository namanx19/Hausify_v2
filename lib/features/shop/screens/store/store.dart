import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/appbar/tabbar.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:hausify_v2/common/widgets/layout/grid_layout.dart';
import 'package:hausify_v2/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/shop/controllers/category_controller.dart';
import 'package:hausify_v2/features/shop/screens/store/widgets/category_tab.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../brand/all_brands.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
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
                expandedHeight: 410, /// #Modification2
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
                      HSectionHeading(text: 'Feature Brands', onPressed: ()=> Get.to(()=>const AllBrandsScreen())),

                        const SizedBox(height: HSizes.spaceBtwItems / 1.5),

                      HGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const HBrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),

                /// -- Tabs
                bottom:  HTabBar(

                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                ),
              ),
            ];
          },

          /// -- Body
          body: TabBarView(
            children: categories.map((category) => HCategoryTab(category: category,)).toList(),
          ),
        ),
      ),
    );
  }
}
