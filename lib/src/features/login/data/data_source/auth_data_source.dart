import 'package:http/http.dart' as http;

class AuthDataSource {
  Future<http.Response> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return http.Response(_fakeAuthResponse, 200);
  }
}

String _fakeAuthResponse =
    '{"id": 1,"username": "kigoUser","email": "test@test.com","name": "Test Test","token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"}';
