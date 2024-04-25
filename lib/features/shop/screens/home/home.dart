import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/home_categories.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:hausify_v2/utils/constants/image_strings.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header
            const HPrimaryHeaderContainer(
              child: Column(
                children: [

                  /// AppBar
                  HHomeAppBar(),
                  SizedBox(height: HSizes.spaceBtwSections,),

                  /// SearchBar
                  HSearchContainer(text: 'Search in Store',),
                  SizedBox(height: HSizes.spaceBtwSections,),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: HSizes.defaultSpace),
                    child: Column(
                      children: [
                        HSectionHeading(text: 'Popular Categories',
                          textColor: Colors.white,
                          showActionButton: false,
                        ),
                        SizedBox(height: HSizes.spaceBtwItems,),

                        /// Categories -- List View
                        HHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            /// Body
            Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: Column(
                children: [

                  /// Promo Carousal Slider
                  const HPromoSlider(banners: [
                    HImages.banner1,
                    HImages.banner2,
                    HImages.banner3,
                  ],),
                  const SizedBox(height: HSizes.spaceBtwSections,),


                  /// Popular Products Vertical Cards
                  HGridLayout(
                    itemCount: 4,
                    itemBuilder: (_ , index ) => const HProductCardVertical(),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}













