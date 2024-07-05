import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_notifier.dart';
import 'widgets/float_cart_button.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_nav_bar.dart';
import 'widgets/indexed_home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget init() => ChangeNotifierProvider(
        create: (_) => HomeNotifier(),
        child: const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: FloatCartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: HomeAppBar(),
      bottomNavigationBar: HomeNavBar(),
      body: IndexedHomeBody(),
    );
  }
}
