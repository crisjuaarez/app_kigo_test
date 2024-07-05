import 'package:app_kigo_test/src/core/constants/app_font_sizes.dart';
import 'package:app_kigo_test/src/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.loginTitle,
      style: TextStyle(
        fontSize: AppFontSizes.screenTitle,
        fontWeight: FontWeight.bold,
        color: AppTheme.secondaryColor,
      ),
    );
  }
}
