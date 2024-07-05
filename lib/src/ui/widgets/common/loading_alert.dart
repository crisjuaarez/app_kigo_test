import 'package:app_kigo_test/src/core/constants/app_dimens.dart';
import 'package:flutter/material.dart';

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({
    super.key,
    this.message = 'Loading...',
    this.loadingColor,
  });

  final String? message;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        child: PopScope(
          canPop: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (message != null) ...[
                Text(
                  message!,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: AppDimens.defaultPaddingValue),
              ],
              CircularProgressIndicator(
                color: loadingColor ?? Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
