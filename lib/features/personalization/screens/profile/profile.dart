import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/common/widgets/images/h_circular_image.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {  },
                title: 'Name',
                value: 'Naman Gupta',
              ),
              HProfileMenu(
                onPressed: () {  },
                title: 'Username',
                value: 'namanx19',
              ),

              const SizedBox(height: HSizes.spaceBtwItems,),
              Divider(),
              const SizedBox(height: HSizes.spaceBtwItems,),


              /// Heading Personal Info
              const HSectionHeading(text: 'Profile Information', showActionButton: false,),
              const SizedBox(height: HSizes.spaceBtwItems,),

              HProfileMenu(
                onPressed: () {  },
                title: 'User ID',
                value: '12345',
                icon: Iconsax.copy,
              ),
              HProfileMenu(
                onPressed: () {  },
                title: 'E-mail',
                value: 'naman@gmail.com',
              ),
              HProfileMenu(
                onPressed: () {  },
                title: 'Phone Number',
                value: '+91 9876543210',
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
                  child: Text(
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


