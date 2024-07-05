import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_strings.dart';
import 'login_notifier.dart';
import 'widgets/biometric_button.dart';
import 'widgets/email_field.dart';
import 'widgets/login_button.dart';
import 'widgets/login_title.dart';
import 'widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginNotifier _loginNotifier;

  @override
  void initState() {
    super.initState();
    _loginNotifier = context.read<LoginNotifier>();
    _loginNotifier.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appName)),
      body: SafeArea(
        child: Padding(
          padding: AppDimens.defaultAllPadding,
          child: Form(
            key: _loginNotifier.formKey,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginTitle(),
                AppDimens.vSeparator,
                EmailField(),
                AppDimens.vSeparator,
                PasswordField(),
                Spacer(),
                BiometricButton(),
                AppDimens.vSeparator,
                LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
