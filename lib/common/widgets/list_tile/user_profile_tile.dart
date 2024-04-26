import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/personalization/screens/profile/profile.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/h_circular_image.dart';

class HUserProfileTile extends StatelessWidget {
  const HUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const HCircularImage(image: HImages.user, width: 50, height: 50, padding: 0,),
      title: Text('Naman Gupta', style: Theme.of(context).textTheme.headlineSmall!.apply(color: HColors.white),),
      subtitle: Text('support@hausify.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: HColors.white),),
      trailing: IconButton(onPressed: () => Get.to(() => const ProfileScreen()), icon: const Icon(Iconsax.edit, color: HColors.white,),),
    );
  }
}