import 'package:flutter/material.dart';

import '../../infra.dart';

class UiTextButton extends StatelessWidget {
  const UiTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: UiTextStyle.bodySmall(
          color: color ?? UiColors.fontColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
