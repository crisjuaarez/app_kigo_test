import 'package:flutter/material.dart';

class AppDimens {
  //Values
  static const double appBarHeight = kToolbarHeight;
  static const double buttonHeight = 56.0;
  static const double defaultPaddingValue = 16.0;
  static const double defaultBorderRadiusValue = 12.0;
  static const defaultModalBorderRadiusValue = 32.0;
  static const vSeparator = SizedBox(height: defaultPaddingValue);
  static const hSeparator = SizedBox(width: defaultPaddingValue);

  //EdgeInsets
  static const EdgeInsets defaultHorizontalPadding = EdgeInsets.symmetric(
    horizontal: defaultPaddingValue,
  );
  static const EdgeInsets defaultVerticalPadding = EdgeInsets.symmetric(
    vertical: defaultPaddingValue,
  );
  static const defaultAllPadding = EdgeInsets.all(defaultPaddingValue);

  //Shapes

  static final defaulBorderRadius = BorderRadius.circular(
    defaultBorderRadiusValue,
  );
  static final ShapeBorder buttonShape = RoundedRectangleBorder(
    borderRadius: defaulBorderRadius,
  );
}
