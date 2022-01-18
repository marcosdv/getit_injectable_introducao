import 'package:get_it_introducao/models/user.dart';
import 'package:get_it_introducao/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SessionManager {
  User? user;

  final AuthRepository _authRepository;

  SessionManager(this._authRepository) {
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _authRepository.getCurrentUser();
  }

  @disposeMethod
  void dispose() {
    print('dispose');
  }
}