import 'package:app_kigo_test/src/core/utils/biometric_helper.dart';
import 'package:app_kigo_test/src/core/utils/secure_preferences.dart';
import 'package:app_kigo_test/src/features/login/domain/repositories/auth_repository.dart';
import 'package:app_kigo_test/src/features/login/ui/screens/login_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart' as mockito;

class MockAuthRepository extends mockito.Mock implements AuthRepository {}

class MockBiometricHelper extends mockito.Mock implements BiometricHelper {}

class MockSecurePreferences extends mockito.Mock implements SecurePreferences {}

void main() {
  group('LoginNotifier', () {
    late MockAuthRepository mockAuthRepository;
    late MockBiometricHelper mockBiometricHelper;
    late LoginNotifier loginNotifier;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockBiometricHelper = MockBiometricHelper();
      loginNotifier = LoginNotifier(
        authRepository: mockAuthRepository,
        biometric: mockBiometricHelper,
      );
      loginNotifier.init();
    });

    test('should toggle password visibility', () {
      expect(loginNotifier.isPasswordVisible, false);
      loginNotifier.togglePasswordVisibility();
      expect(loginNotifier.isPasswordVisible, true);
    });
  });
}
