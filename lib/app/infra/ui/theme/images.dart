import 'package:flutter/material.dart';

class UiImages {
  static const String _path = 'assets';

  static Image appIcon({double? height, double? width}) =>
      Image.asset('$_path/app_icon.png', height: height, width: width);
}
