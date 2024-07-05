import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_notifier.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (_, notifier, __) {
        final index = notifier.currentIndex;
        return BottomNavigationBar(
          currentIndex: index,
          onTap: notifier.setCurrentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Tienda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
        );
      },
    );
  }
}
