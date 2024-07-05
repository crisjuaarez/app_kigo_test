import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../products/ui/screens/products/products_screen.dart';
import '../../../../profile/ui/screens/profile_screen.dart';
import '../home_notifier.dart';

class IndexedHomeBody extends StatelessWidget {
  const IndexedHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (_, notifier, __) => IndexedStack(
        index: notifier.currentIndex,
        children: const [
          ProductsScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
