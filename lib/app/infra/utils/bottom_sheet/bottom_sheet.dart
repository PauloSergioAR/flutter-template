import 'package:flutter/material.dart';

import '../../infra.dart';

abstract class UiBottomSheet {
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onAction,
    VoidCallback? onBack,
    String actionMessage = 'OK',
    String backMessage = '',
    bool isDismissible = true,
    bool enableDrag = true,
  }) =>
      _baseBottomSheet(
        context: context,
        title: title,
        message: message,
        actionMessage: actionMessage,
        backMessage: backMessage,
        onAction: onAction,
        onBack: onBack,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
      );
}

Future<bool?> _baseBottomSheet({
  required BuildContext context,
  required String title,
  required String message,
  required String actionMessage,
  required String backMessage,
  required VoidCallback onAction,
  required VoidCallback? onBack,
  required bool? isDismissible,
  required bool? enableDrag,
}) {
  return showModalBottomSheet(
    isDismissible: isDismissible!,
    enableDrag: enableDrag!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: UiColors.grey300,
              blurRadius: 12,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.height),
            _slider(),
            SizedBox(height: 24.height),
            Text(
              title,
              textAlign: TextAlign.center,
              style: UiTextStyle.heading20(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.height),
            Text(
              message,
              textAlign: TextAlign.center,
              style: UiTextStyle.bodySmall(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16.height),
            UiButton(
              label: actionMessage,
              onPressed: onAction,
            ),
            SizedBox(height: 10.height),
            Visibility(
              visible: backMessage.isNotEmpty,
              child: UiTextButton(
                label: backMessage,
                onPressed: onBack ?? () {},
              ),
            ),
            SizedBox(height: 20.height),
          ],
        ),
      );
    },
  );
}

Container _slider() {
  return Container(
    height: 3,
    width: 26,
    decoration: BoxDecoration(
      color: UiColors.grey300,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
