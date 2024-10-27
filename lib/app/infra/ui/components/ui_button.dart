import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../infra.dart';

class UiButton extends StatelessWidget {
  const UiButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disabledOnPressed,
    this.size,
    this.labelStyle,
    this.labelAlign,
    this.sufixIcon,
    this.prefixIcon,
    this.backgroundColor = UiColors.primary,
    this.foregroundColor = UiColors.primary,
    this.shadowColor = Colors.transparent,
    this.labelColor = Colors.white,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.isDisabled = false,
    this.borderStyle = BorderSide.none,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final VoidCallback? disabledOnPressed;
  final Size? size;
  final TextStyle? labelStyle;
  final Alignment? labelAlign;
  final dynamic prefixIcon;
  final dynamic sufixIcon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final Color labelColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;
  final bool isDisabled;
  final BorderSide? borderStyle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Color textColor = (!isDisabled && !isLoading)
        ? labelColor
        : disabledTextColor ?? UiColors.grey100;

    Color disabledBackgroundColor =
        this.disabledBackgroundColor ?? UiColors.grey400;

    Widget buildIcon(dynamic icon, EdgeInsets padding) {
      if (icon == null) return const SizedBox();
      if (icon is IconData) {
        return Icon(icon, color: textColor).addPadding(padding);
      } else if (icon is SvgPicture) {
        return icon.addPadding(padding);
      } else {
        return icon;
      }
    }

    return ElevatedButton(
      onPressed: (!isDisabled && !isLoading) ? onPressed : disabledOnPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        fixedSize: size ?? const Size(double.maxFinite, 38),
        backgroundColor:
            !isDisabled ? backgroundColor : disabledBackgroundColor,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        shadowColor: shadowColor,
        alignment: labelAlign,
        textStyle: labelStyle,
        splashFactory: InkRipple.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: borderStyle!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: prefixIcon != null && !isLoading,
            child: buildIcon(prefixIcon, const EdgeInsets.only(right: 8)),
          ),
          Visibility(
            visible: !isLoading,
            replacement: SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(color: textColor).addPadding(
                const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 4,
                ),
              ),
            ),
            child: Text(
              label,
              style: labelStyle ??
                  UiTextStyle.bodySmall(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Visibility(
            visible: sufixIcon != null && !isLoading,
            child: buildIcon(sufixIcon, const EdgeInsets.only(left: 8)),
          ),
        ],
      ),
    );
  }
}
