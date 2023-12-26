import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_fit/service/api_service.dart';

class AuthenticationService {
  late final FirebaseAuth _firebaseAuth = FirebaseAuth.instance..setLanguageCode('ja');
  late final api = Get.find<ApiService>();

  Future<void> registerAnonymously() async {
    final credential = await _firebaseAuth.signInAnonymously();
    final token = await credential.user?.getIdToken();
    if (token == null) {
      return;
    }
    // await api.registerAnonymously(token);
    // await api.login(token);
  }

  User? getCurrentUser() => _firebaseAuth.currentUser;
}

class AuthException implements Exception {
  AuthException(this.message);

  final String message;
}
