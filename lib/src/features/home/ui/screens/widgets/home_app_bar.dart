import 'package:app_kigo_test/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox.shrink(),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        AppStrings.appName,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
