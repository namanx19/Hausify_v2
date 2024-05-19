import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/features/personalization/controllers/address_controller.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar:
          const HAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Form(
              key: controller.addressFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                      controller: controller.name,
                      validator: (value) => HValidator.validateEmptyText('Name', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')
                  ),
                  const SizedBox(height: HSizes.spaceBtwInputFields),
                  TextFormField(
                      controller: controller.phoneNumber,
                      validator: HValidator.validatePhoneNumber,
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')
                  ),
                  const SizedBox(height: HSizes.spaceBtwInputFields),

                  Row(
                    children: [
                    Expanded(
                      child: TextFormField(
                          controller: controller.street,
                          validator: (value) => HValidator.validateEmptyText('Street', value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'))
                      ),
                    const SizedBox(width: HSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          controller: controller.postalCode,
                          validator: (value) => HValidator.validateEmptyText('Postal Code', value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'))
                    ),
                    ],
                  ),
                  const SizedBox(height: HSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.city,
                          validator: (value) => HValidator.validateEmptyText('City', value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))
                      ),
                      const SizedBox(width: HSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: controller.state,
                          validator: (value) => HValidator.validateEmptyText('State', value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'))
                      ),
                    ],
                  ),
                  const SizedBox(height: HSizes.spaceBtwInputFields),
                  TextFormField(
                      controller: controller.country,
                      validator: (value) => HValidator.validateEmptyText('Country', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
                  const SizedBox(height: HSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => controller.addNewAddresses(), child: const Text('Save')),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
