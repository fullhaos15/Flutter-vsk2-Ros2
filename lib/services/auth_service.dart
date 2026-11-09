import 'package:firebase_auth/firebase_auth.dart';

/// Обёртка над FirebaseAuth. Методы возвращают null при успехе
/// или текст ошибки на русском.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<String?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await cred.user?.updateDisplayName(name);
      return null;
    } on FirebaseAuthException catch (e) {
      return _message(e.code);
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return _message(e.code);
    }
  }

  Future<void> signOut() => _auth.signOut();

  String _message(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Этот email уже зарегистрирован';
      case 'invalid-email':
        return 'Некорректный email';
      case 'weak-password':
        return 'Слишком простой пароль (минимум 6 символов)';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Неверный email или пароль';
      case 'network-request-failed':
        return 'Нет подключения к сети';
      default:
        return 'Ошибка: $code';
    }
  }
}
