import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../infra.dart';

extension BuildContextExtension on BuildContext {
  void handleMessage({
    required String titleKey,
    required String messageKey,
    required String actionMessage,
    String? backMessage,
    bool? isDismissible = true,
    bool? enableDrag = true,
    VoidCallback? onAction,
    VoidCallback? onBack,
  }) {
    UiBottomSheet.show(
      context: this,
      title: titleKey.translate(),
      message: messageKey.translate(),
      enableDrag: enableDrag!,
      actionMessage: actionMessage,
      backMessage: backMessage ?? '',
      onAction: onAction ?? () => Navigator.pop(this),
      onBack: onBack ?? () => Modular,
    );
  }
}
