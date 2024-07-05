import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/widget_keys.dart';
import '../../../../../ui/alerts/app_alerts.dart';
import '../../../../../ui/widgets/button/my_button.dart';
import '../../../../home/ui/screens/home_screen.dart';
import '../login_notifier.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      key: WidgetKeys.signInButton,
      text: AppStrings.signIn,
      onPressed: () async {
        if (context.read<LoginNotifier>().formKey.currentState!.validate()) {
          FocusScope.of(context).requestFocus(FocusNode());
          await _signIn(context);
        }
      },
    );
  }

  Future<void> _signIn(BuildContext context) async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final notifier = context.read<LoginNotifier>();
    final email = notifier.emailController.text.trim();
    final password = notifier.passwordController.text;

    AppAlerts.showLoading(context);
    final result = await notifier.signInWithEmailAndPassword(email, password);
    navigator.pop();
    result.fold(
      (l) {
        messenger.showSnackBar(SnackBar(content: Text(l.message)));
      },
      (r) {
        navigator.pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen.init()),
        );
      },
    );
  }
}
