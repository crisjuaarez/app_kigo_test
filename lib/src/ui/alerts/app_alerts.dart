import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common/loading_alert.dart';

class AppAlerts {
  static Future<void> showLoading(
    BuildContext context, {
    String? message,
    Color? barrierColor,
    Color? loadingColor,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: barrierColor ?? AppTheme.primaryColor.withOpacity(0.75),
      builder: (_) => LoadingAlert(
        message: message,
        loadingColor: loadingColor,
      ),
    );
  }
}
