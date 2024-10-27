import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

extension StringExtension on String {
  Color toColor() {
    var buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String translate() => i18n();

  String removeSymbols() => replaceAll(RegExp(r'[^\s\w]'), '');
}
