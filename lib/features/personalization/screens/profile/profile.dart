import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/images/h_circular_image.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: HAppBar(showBackArrow: true, title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium,),),
      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [

              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const HCircularImage(image: HImages.user, width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: HSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: HSizes.spaceBtwItems,),

              /// Heading Personal Information
              const HSectionHeading(text: 'Profile Information', showActionButton: false,),
              const SizedBox(height: HSizes.spaceBtwItems,),

              HProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              HProfileMenu(
                onPressed: () {  },
                title: 'Username',
                value: controller.user.value.username,
              ),

              const SizedBox(height: HSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: HSizes.spaceBtwItems,),


              /// Heading Personal Info
              const HSectionHeading(text: 'Profile Information', showActionButton: false,),
              const SizedBox(height: HSizes.spaceBtwItems,),

              HProfileMenu(
                onPressed: () {  },
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              HProfileMenu(
                onPressed: () {  },
                title: 'E-mail',
                value: controller.user.value.email,
              ),
              HProfileMenu(
                onPressed: () {  },
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
              ),
              HProfileMenu(
                onPressed: () {  },
                title: 'Gender',
                value: 'Male',
              ),
              HProfileMenu(
                onPressed: () {  },
                title: 'Date of Birth',
                value: 'DD-MM-YYYY',
              ),

              const Divider(),
              const SizedBox(height: HSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
              )


            ],
          ),
        )
      ),
    );
  }
}


