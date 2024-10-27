import 'package:flutter/material.dart';

import '../../infra.dart';

class UiTitledText {
  static Widget tile(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: UiTextStyle.bodySmall(),
        ),
        Text(
          text,
          style: UiTextStyle.bodyMedium(
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
