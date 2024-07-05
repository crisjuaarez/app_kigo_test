import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Consumer;

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/widget_keys.dart';
import '../../../../../core/utils/form_validators.dart';
import '../../widgets/my_text_form_field.dart';
import '../login_notifier.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (_, notifier, __) {
        return MyTextFormField(
          key: WidgetKeys.signInPasswordField,
          controller: notifier.passwordController,
          labelText: AppStrings.passwordLabel,
          hintText: AppStrings.passwordHint,
          prefixIcon: const Icon(Icons.lock_outline),
          isPassword: !notifier.isPasswordVisible,
          validator: (password) {
            if (FormValidators.password(password)) return null;
            return AppStrings.passwordError;
          },
          suffiexIcon: IconButton(
            onPressed: () => notifier.togglePasswordVisibility(),
            icon: Icon(
              !notifier.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
        );
      },
    );
  }
}
