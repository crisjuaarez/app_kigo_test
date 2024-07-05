import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/biometric_helper.dart';
import '../../../../core/utils/secure_preferences.dart';
import '../../../shared/domain/entities/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class LoginNotifier with ChangeNotifier {
  final AuthRepository authRepository;
  final BiometricHelper biometric;
  LoginNotifier({required this.authRepository, required this.biometric});

  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  String? _email;

  String? get email => _email;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void init() async {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _hasLoggedIn = await getSignInDetails();
    notifyListeners();
  }

  bool _hasLoggedIn = false;
  bool get hasLoggedIn => _hasLoggedIn;

  Future<bool> isBiometricsAvailable() async {
    if (hasLoggedIn) return await authWithBiometrics();
    notifyListeners();
    return false;
  }

  void disp() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<bool> authWithBiometrics() async {
    final isAvailable = await biometric.isBiometricAvailable();
    if (isAvailable) {
      bool isAuthenticated = await biometric.authenticateWithBiometrics();
      if (!isAuthenticated) isAuthenticated = await biometric.authenticate();
      return isAuthenticated;
    }
    return false;
  }

  Future<void> saveSignInDetails(String email, String password) async {
    await SecurePreferences.saveEmail(email);
    await SecurePreferences.savePassword(password);
  }

  Future<bool> getSignInDetails() async {
    _email = await SecurePreferences.getEmail();
    final password = await SecurePreferences.getPassword();
    if (_email != null && password != null) {
      emailController.text = _email!;
      // passwordController.text = password;
      return true;
    }
    return false;
  }

  bool _isSignInLoading = false;
  bool get isSignInLoading => _isSignInLoading;
  set isSignInLoading(bool value) {
    _isSignInLoading = value;
    notifyListeners();
  }

  Failure? _error;
  Failure? get error => _error;

  Future<Either<Failure, User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    isSignInLoading = true;
    final either = await authRepository.signIn(email, password);
    either.fold(
      (l) {
        _error = l;
        log(l.message);
      },
      (r) async {
        _error = null;
        await saveSignInDetails(email, password);
      },
    );
    isSignInLoading = false;
    return either;
  }
}
