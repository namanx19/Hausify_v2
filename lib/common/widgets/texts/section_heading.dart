import 'package:flutter/material.dart';

class HSectionHeading extends StatelessWidget {
  const HSectionHeading({
    super.key,
    required this.text,
    this.buttonTitle = 'View all',
    this.textColor,
    this.showActionButton = true,
    this.onPressed,
  });

  final String text, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
              onPressed: onPressed,
              child: Text(
                buttonTitle,
              )
          ),
      ],
    );
  }
}
