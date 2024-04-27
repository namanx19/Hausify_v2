import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const HAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Form(child: Column(children: [
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),

            const SizedBox(height: HSizes.spaceBtwInputFields),

            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),

            const SizedBox(height: HSizes.spaceBtwInputFields),


            Row(children: [

              Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'))),
              const SizedBox(width: HSizes.spaceBtwInputFields),

              Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'))),

              

            ],),

            const SizedBox(height: HSizes.spaceBtwInputFields),

            Row(children: [

              Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))),
              const SizedBox(width: HSizes.spaceBtwInputFields),

              Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'))),



            ],),
            const SizedBox(height: HSizes.spaceBtwInputFields),
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
            const SizedBox(height: HSizes.defaultSpace),
            SizedBox(width: double.infinity,child:  ElevatedButton(onPressed: (){}, child: const Text('Save')),)



          ],)),
        ),
      ),
    );
  }
}
