import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../sub_category/sub_categories.dart';

class HHomeCategories extends StatelessWidget {
  const HHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85, /// #Issue3
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            return HVerticalImageText(
              image: HImages.shoeIcon,
              title: 'Shoes',
              onTap: () => Get.to(()=> const SubCategoriesScreen()),
            );
          }
      ),
    );
  }
}