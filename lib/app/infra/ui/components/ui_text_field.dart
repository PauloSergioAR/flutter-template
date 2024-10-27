import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../infra.dart';

class UiTextFormField extends FormField<String> {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType formFieldType;
  final String? Function(String?)? validators;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enable;
  final Color? fillColor;
  final Color? backgroundColor;
  final bool autofocus;
  final bool obscureText;
  final VoidCallback? toggleObscureText;
  final AutovalidateMode validadeMode;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool withBorder;
  final int maxLines;
  final int? maxLength;
  final String? initialText;
  final String label;
  final Color? labelColor;
  final double? borderRadius;
  final bool isBorderPrimary500;
  final TextStyle? colorText;
  final TextCapitalization textCapitalization;

  UiTextFormField({
    super.key,
    this.labelText = '',
    this.controller,
    this.formFieldType = TextInputType.text,
    this.validators,
    this.onEditingComplete,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.enable = true,
    this.fillColor,
    this.autofocus = false,
    this.obscureText = false,
    this.toggleObscureText,
    this.validadeMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.focusNode,
    this.withBorder = true,
    this.maxLines = 1,
    this.maxLength,
    this.initialText,
    this.onFieldSubmitted,
    this.labelColor,
    this.label = '',
    this.borderRadius,
    this.backgroundColor,
    this.isBorderPrimary500 = false,
    this.colorText,
    this.textCapitalization = TextCapitalization.none,
  }) : super(
          autovalidateMode: validadeMode,
          validator: validators,
          enabled: true,
          builder: (field) {
            void onChangesdHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: label != '',
                  child: Text(
                    label,
                    style: UiTextStyle.bodySmall(
                      color: labelColor ?? UiColors.grey900,
                      fontWeight: FontWeight.w400,
                    ),
                  ).addPadding(const EdgeInsets.only(bottom: 6)),
                ),
                Container(
                  height: maxLines > 1 ? 100 : 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: backgroundColor ?? Colors.white,
                  ),
                  child: TextFormField(
                    textCapitalization: textCapitalization,
                    focusNode: focusNode,
                    inputFormatters: inputFormatters,
                    controller: controller,
                    initialValue: initialText,
                    enabled: enable,
                    keyboardType: formFieldType,
                    obscureText: obscureText,
                    autovalidateMode: validadeMode,
                    onTap: onTap,
                    onFieldSubmitted: onFieldSubmitted,
                    onEditingComplete: onEditingComplete,
                    onChanged: (value) {
                      onChangesdHandler(value);
                      onChanged ?? (value);
                    },
                    autofocus: autofocus,
                    maxLines: maxLines,
                    maxLength: maxLength,
                    cursorColor: UiColors.grey800,
                    style: UiTextStyle.bodySmall(
                      color: enable || fillColor != null
                          ? UiColors.grey800
                          : UiColors.grey800.withOpacity(
                              0.6,
                            ),
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      alignLabelWithHint: true,
                      labelText: labelText,
                      labelStyle: colorText ??
                          UiTextStyle.bodySmall(
                            color: UiColors.grey400,
                            fontWeight: FontWeight.w400,
                          ),
                      errorStyle: const TextStyle(
                        fontSize: 0,
                        height: -100,
                      ),
                      filled: fillColor != null || !enable,
                      fillColor:
                          !enable ? fillColor ?? Colors.transparent : fillColor,
                      prefixIcon: prefixIcon,
                      suffixIcon: toggleObscureText != null
                          ? suffixIcon ??
                              _hiddenTextIcon(
                                isObscure: obscureText,
                                onTap: toggleObscureText,
                                primary: UiColors.grey400,
                              )
                          : suffixIcon,
                      errorMaxLines: null,
                      contentPadding: maxLines > 1
                          ? const EdgeInsets.only(left: 10, top: 10, right: 10)
                          : const EdgeInsets.only(left: 10),
                      enabledBorder: !withBorder
                          ? null
                          : _borderStyle(
                              isFocused: true,
                              isColorBorder: isBorderPrimary500
                                  ? isBorderPrimary500
                                  : false,
                              borderRadius: borderRadius ?? 6,
                            ),
                      disabledBorder: !withBorder
                          ? null
                          : _borderStyle(
                              borderRadius: borderRadius ?? 6,
                            ),
                      focusedBorder: !withBorder
                          ? null
                          : _borderStyle(
                              isFocused: true,
                              borderRadius: borderRadius ?? 6,
                            ),
                      errorBorder: !withBorder
                          ? null
                          : _borderStyle(
                              isError: field.hasError,
                              borderRadius: borderRadius ?? 6,
                            ),
                      focusedErrorBorder: !withBorder
                          ? null
                          : _borderStyle(
                              isError: field.hasError,
                              borderRadius: borderRadius ?? 6,
                            ),
                    )
                        .applyDefaults(
                          Theme.of(field.context).inputDecorationTheme,
                        )
                        .copyWith(
                          errorText: field.errorText,
                        ),
                  ),
                ),
                Visibility(
                  visible: field.hasError,
                  child: Text(
                    field.errorText ?? '',
                    style: UiTextStyle.bodyXSmall(color: UiColors.red400),
                  ),
                ),
              ],
            );
          },
        );
  @override
  _UiTextFormFieldState createState() => _UiTextFormFieldState();
}

InkWell _hiddenTextIcon({
  required bool isObscure,
  required Color primary,
  required VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(99),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 400),
          crossFadeState:
              isObscure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Icon(
            Icons.visibility,
            color: primary,
          ),
          secondChild: Icon(
            Icons.visibility_off,
            color: primary,
          ),
        ),
      ],
    ),
  );
}

InputBorder _borderStyle({
  bool isError = false,
  bool isFocused = false,
  bool isColorBorder = false,
  required double borderRadius,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(
      color: isColorBorder
          ? UiColors.grey400
          : (isError ? UiColors.red400 : UiColors.grey400),
    ),
  );
}

class _UiTextFormFieldState extends FormFieldState<String> {
  TextEditingController? get _effectiveController => widget.controller;

  @override
  UiTextFormField get widget => super.widget as UiTextFormField;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_handleControllerChanged);
  }

  @override
  void didUpdateWidget(UiTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);
    if (_effectiveController?.text != value) {
      _effectiveController?.text = value ?? '';
    }
  }

  void _handleControllerChanged() {
    if (_effectiveController!.text != value) {
      didChange(_effectiveController!.text);
    }
  }
}
