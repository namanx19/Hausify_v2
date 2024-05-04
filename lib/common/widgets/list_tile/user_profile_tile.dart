import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/features/personalization/controllers/user_controller.dart';
import 'package:hausify_v2/features/personalization/screens/profile/profile.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/h_circular_image.dart';

class HUserProfileTile extends StatelessWidget {
  const HUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const HCircularImage(image: HImages.user, width: 50, height: 50, padding: 0,),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: HColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: HColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: HColors.white,),),
    );
  }
}