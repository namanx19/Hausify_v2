import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:hausify_v2/utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';

class HChoiceChip extends StatelessWidget {
  const HChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? HColors.white : null),
        avatar: isColor
            ? HCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: HHelperFunctions.getColor(text)!)
            : null,

        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        // Make icon in the center
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? HHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
