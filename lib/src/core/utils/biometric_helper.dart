import 'dart:developer';

import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  final _localAuthentication = LocalAuthentication();

  /// Check if biometrics are available on the device
  Future<bool> isBiometricAvailable() async {
    try {
      final result = await _localAuthentication.canCheckBiometrics &&
          await _localAuthentication.isDeviceSupported();

      return result;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getBiometricTypeLabel() async {
    final biometrics = await getAvailableBiometrics();
    log('biometrics: $biometrics');
    if (biometrics.isNotEmpty) {
      final biometric = biometrics.first;

      if (biometric == BiometricType.face) return 'Face ID';
      return 'Huella digital';
    }
    return null;
  }

  /// Get a list of available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      final result = await _localAuthentication.getAvailableBiometrics();

      return result;
    } catch (e) {
      return <BiometricType>[];
    }
  }

  /// Authenticate using biometrics
  Future<bool> authenticateWithBiometrics() async {
    try {
      return await _localAuthentication.authenticate(
        localizedReason: 'Por favor, autentíquese para acceder',
        options: const AuthenticationOptions(
          useErrorDialogs: false,
          stickyAuth: true,
          biometricOnly: true,
          sensitiveTransaction: true,
        ),
      );
    } catch (e) {
      return false;
    }
  }

  /// Authenticate using biometrics or device passcode
  Future<bool> authenticate() async {
    try {
      return await _localAuthentication.authenticate(
        localizedReason: 'Por favor, autentíquese para acceder',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          sensitiveTransaction: true,
        ),
      );
    } catch (e) {
      return false;
    }
  }
}
