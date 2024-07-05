import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_strings.dart';
import 'core/utils/biometric_helper.dart';
import 'features/login/data/data_source/auth_data_source.dart';
import 'features/login/data/repositories/auth_repository_impl.dart';
import 'features/login/ui/screens/login_notifier.dart';
import 'features/login/ui/screens/login_screen.dart';
import 'features/products/data/data_source/products_data_source.dart';
import 'features/products/data/repositories/products_repository_impl.dart';
import 'features/products/ui/providers/cart_provider.dart';
import 'features/products/ui/providers/products_provider.dart';
import 'ui/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ProductsDataSource()),
        Provider(create: (_) => AuthDataSource()),
        Provider(create: (_) => BiometricHelper()),
        Provider(
          create: (context) => ProductsRepositoryImpl(
            dataSource: context.read<ProductsDataSource>(),
          ),
        ),
        Provider(
          create: (context) => AuthRepositoryImpl(
            authDataSource: context.read<AuthDataSource>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginNotifier(
            authRepository: context.read<AuthRepositoryImpl>(),
            biometric: context.read<BiometricHelper>(),
          ),
        ),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(
            productsRepository: context.read<ProductsRepositoryImpl>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        home: const LoginScreen(),
        theme: AppTheme.themeData,
      ),
    );
  }
}
