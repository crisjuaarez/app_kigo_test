import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../ui/alerts/app_alerts.dart';
import '../../../../ui/theme/app_theme.dart';
import '../../../../ui/widgets/button/my_button.dart';
import '../../../login/ui/screens/login_notifier.dart';
import '../../../login/ui/screens/login_screen.dart';
import 'widgets/profile_item_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginNotifier = context.read<LoginNotifier>();
    return Scaffold(
      body: Padding(
        padding: AppDimens.defaultHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Perfil',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
            const ProfileItemTile(
              icon: Icons.person_2_outlined,
              title: 'Usuario',
              subtitle: 'KigoUser',
            ),
            ProfileItemTile(
              icon: Icons.mail_outline,
              title: 'Correo electrónico',
              subtitle: loginNotifier.email ?? '',
            ),
            const Spacer(),
            MyButton(
              text: 'Cerrar sesión',
              onPressed: () => _logout(context),
            ),
            const SizedBox(height: kToolbarHeight),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    final navigator = Navigator.of(context);
    AppAlerts.showLoading(context);
    await Future.delayed(const Duration(seconds: 2));
    navigator.pop();
    navigator.pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }
}
