import 'package:flutter/material.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/home_categories.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header
            HPrimaryHeaderContainer(
              child: Column(
                children: [

                  /// AppBar
                  HHomeAppBar(),
                  SizedBox(height: HSizes.spaceBtwSections,),

                  /// SeachBar
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
          ],
        ),
      ),
    );
  }
}








