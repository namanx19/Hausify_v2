import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';
import 'package:hausify_v2/utils/constants/sizes.dart';
import 'package:hausify_v2/utils/validators/validation.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom AppBar
      appBar: HAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text('Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: HSizes.spaceBtwSections,),

            /// Text Field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => HValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: HTexts.firstName),
                  ),
                  const SizedBox(height: HSizes.spaceBtwInputFields,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => HValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: HTexts.lastName),
                  )
                ],
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwSections,),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child:const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}