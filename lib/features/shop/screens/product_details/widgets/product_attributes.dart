import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hausify_v2/common/widgets/chips/choice_chip.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hausify_v2/common/widgets/texts/product_price_text.dart';
import 'package:hausify_v2/common/widgets/texts/product_title_text.dart';
import 'package:hausify_v2/common/widgets/texts/section_heading.dart';
import 'package:hausify_v2/features/shop/controllers/product/variation_controller.dart';
import 'package:hausify_v2/utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class HProductAttributes extends StatelessWidget {
  const HProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = HHelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          /// -- Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            HRoundedContainer(
              padding: const EdgeInsets.all(HSizes.md),
              backgroundColor: dark ? HColors.darkerGrey : HColors.grey,
              child: Column(
                children: [
                  /// Title, Price and Stock Status
                  Row(
                    children: [
                      const HSectionHeading(
                          text: 'Variation', showActionButton: false),
                      const SizedBox(
                        width: HSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const HProductTitleText(
                                  title: 'Price :', smallSize: true),
                              const SizedBox(width: HSizes.spaceBtwItems / 3),

                              /// we can either remove the extra space or keep it if needed
                              ///const SizedBox(width: HSizes.spaceBtwItems),

                              /// Actual Price
                              Text(
                                '\₹${controller.getVariationPrice()} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),

                              const SizedBox(width: HSizes.spaceBtwItems),

                              /// Sale Price

                              HProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const HProductTitleText(
                                  title: 'Stock : ', smallSize: true),
                              Text(controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Variation Description
                  HProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),

          const SizedBox(
            height: HSizes.spaceBtwItems,
          ),

          /// -- Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HSectionHeading(
                            text: attribute.name ?? '',
                            showActionButton: false),
                        const SizedBox(height: HSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;

                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);

                              return HChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null);
                            }).toList(),
                          ),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
