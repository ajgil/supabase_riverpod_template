// Definicion del datasource

import '../entities/user_entity.dart';
abstract class AuthRepository {

    Future<UserEntity> signIn(
      {required String email, required String password});

  /// Store token
  Future<void> setSession(String token);

  /// restore session from token
  Future<UserEntity> restoreSession();

  // check AuthStatus
  Future<UserEntity> checkAuthStatus( String token);

}