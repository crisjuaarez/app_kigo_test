import 'package:flutter/material.dart';

import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_font_sizes.dart';
import '../../theme/app_theme.dart';

enum ButtonType { primary, secondary }

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onPressed,
    required this.text,
    this.type = ButtonType.primary,
  });

  final VoidCallback? onPressed;
  final String text;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,
      height: AppDimens.appBarHeight,
      decoration: type == ButtonType.primary
          ? null
          : BoxDecoration(
              border: Border.all(color: AppTheme.primaryColor),
              borderRadius: AppDimens.defaulBorderRadius,
            ),
      child: MaterialButton(
        elevation: 0,
        onPressed: onPressed,
        shape: AppDimens.buttonShape,
        color:
            type == ButtonType.primary ? AppTheme.primaryColor : Colors.white,
        child: Text(
          text,
          style: TextStyle(
            color: type == ButtonType.primary
                ? Colors.white
                : AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSizes.bodyLarge,
          ),
        ),
      ),
    );
  }
}
