import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/widget_keys.dart';
import '../../../../../core/utils/form_validators.dart';
import '../../widgets/my_text_form_field.dart';
import '../login_notifier.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      key: WidgetKeys.signInEmailField,
      controller: context.read<LoginNotifier>().emailController,
      validator: (email) {
        if (FormValidators.email(email)) return null;
        return AppStrings.emailError;
      },
      hintText: AppStrings.emailLabel,
      labelText: AppStrings.emailHint,
      prefixIcon: const Icon(Icons.email_outlined),
    );
  }
}
