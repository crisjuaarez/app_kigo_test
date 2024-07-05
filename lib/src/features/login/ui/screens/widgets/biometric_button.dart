import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/biometric_helper.dart';
import '../../../../../ui/alerts/app_alerts.dart';
import '../../../../../ui/widgets/button/my_button.dart';
import '../../../../home/ui/screens/home_screen.dart';
import '../login_notifier.dart';

class BiometricButton extends StatelessWidget {
  const BiometricButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (!context.watch<LoginNotifier>().hasLoggedIn) return const SizedBox();
    return FutureBuilder(
      future: context.read<BiometricHelper>().getBiometricTypeLabel(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final label = snapshot.data;
          if (label != null) {
            return MyButton(
              type: ButtonType.secondary,
              text: 'Ingresa con $label',
              onPressed: () => _signInWithBiometrics(context),
            );
          }
        }
        return const SizedBox();
      },
    );
  }

  Future<void> _signInWithBiometrics(BuildContext context) async {
    final navigator = Navigator.of(context);
    final notifier = context.read<LoginNotifier>();

    final isBiometricAvailable = await notifier.isBiometricsAvailable();

    if (isBiometricAvailable) {
      if (context.mounted) AppAlerts.showLoading(context);
      await Future.delayed(const Duration(seconds: 1));
      navigator.pop();
      navigator.pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen.init()),
      );
    }
  }
}
