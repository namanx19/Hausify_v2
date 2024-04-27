import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/h_rounded_image.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const HRoundedImage(
                  width: double.infinity,
                  imageUrl: HImages.promoBanner3,
                  applyImageRadius: true),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  HSectionHeading(text: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: HSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder:(context, index) =>const SizedBox(width: HSizes.spaceBtwItems,) ,
                        itemBuilder: (context, index) =>
                      const HProductCardHorizontal(),
                    
                    ),
                  ),
                ],
              ),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
