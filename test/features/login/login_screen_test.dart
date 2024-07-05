import 'package:app_kigo_test/src/core/constants/widget_keys.dart';
import 'package:app_kigo_test/src/core/utils/biometric_helper.dart';
import 'package:app_kigo_test/src/features/home/ui/screens/home_screen.dart';
import 'package:app_kigo_test/src/features/login/data/data_source/auth_data_source.dart';
import 'package:app_kigo_test/src/features/login/data/repositories/auth_repository_impl.dart';
import 'package:app_kigo_test/src/features/login/ui/screens/login_notifier.dart';
import 'package:app_kigo_test/src/features/login/ui/screens/login_screen.dart';
import 'package:app_kigo_test/src/features/products/data/data_source/products_data_source.dart';
import 'package:app_kigo_test/src/features/products/data/repositories/products_repository_impl.dart';
import 'package:app_kigo_test/src/features/products/ui/providers/cart_provider.dart';
import 'package:app_kigo_test/src/features/products/ui/providers/products_provider.dart';
import 'package:app_kigo_test/src/ui/widgets/common/loading_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockAuthRepository extends Mock implements AuthRepositoryImpl {}

class MockBiometricHelper extends Mock implements BiometricHelper {}

class MockLoginNotifier extends Mock implements LoginNotifier {}

void main() {
  // late MockLoginNotifier mockLoginNotifier;

  setUp(() {
    // mockLoginNotifier = MockLoginNotifier();
  });

  // Función para crear un widget de LoginScreen como nuestro my_app.dart
  Future<void> pumpLoginScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
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
        child: const MaterialApp(home: LoginScreen()),
      ),
    );
    await tester.pumpAndSettle();
  }

  //Test para asegurarnos que los componentes de LoginScreen se muestran correctamente
  testWidgets('LoginScreen shows email and password fields and login button',
      (tester) async {
    await pumpLoginScreen(tester);

    // Verificamos que los campos de email y password se muestran
    expect(find.byKey(WidgetKeys.signInEmailField), findsOneWidget);
    expect(find.byKey(WidgetKeys.signInPasswordField), findsOneWidget);
    // Verificamos que el botón de login se muestra
    expect(find.byKey(WidgetKeys.signInButton), findsOneWidget);
  });

  testWidgets('LoginScreen with empty email and password trying to login',
      (tester) async {
    await pumpLoginScreen(tester);
    // Verificamos que el widget LoginScreen se muestra
    expect(find.byType(LoginScreen), findsOneWidget);
    // Presionamos el botón de login
    await tester.tap(find.byKey(WidgetKeys.signInButton));
    // Esperamos a que el widget se muestre
    await tester.pump();
    // Verificamos que el widget LoginScreen se sigue mostrando
    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('LoginScreen with empty email and password trying to login',
      (tester) async {
    await pumpLoginScreen(tester);

    // Introducimos texto en los campos de email y password
    await tester.enterText(
      find.byKey(WidgetKeys.signInEmailField),
      'test@test.com',
    );

    await tester.enterText(
      find.byKey(WidgetKeys.signInPasswordField),
      '123456',
    );

    // Cerramos el teclado tocando fuera de los campos de texto
    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();

    // Presionamos el botón de login
    await tester.tap(find.byKey(WidgetKeys.signInButton));
    await tester.pump(); // Esperamos a que el botón se presione
    // Verificamos que se muestra el alerta de carga
    expect(find.byType(LoadingAlert), findsOneWidget);
    // Esperamos a que el alerta de carga se muestre
    await tester.pumpAndSettle(const Duration(seconds: 2));
    // Verificamos que el widget HomeScreen se muestra
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('LoginScreen with valid email and password trying to login',
      (tester) async {
    await pumpLoginScreen(tester);
    await tester.enterText(
      find.byKey(WidgetKeys.signInEmailField),
      'test@test.com',
    );
    await tester.enterText(
      find.byKey(WidgetKeys.signInPasswordField),
      '123456',
    );
    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(WidgetKeys.signInButton));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
