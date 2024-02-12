// reglas de negocio
// no es la implementacion
// como queremos que sean los sistemas de auth

import '../entities/user_entity.dart';

abstract class AuthDatasource {
  // login
  Future<UserEntity> signIn(String email, String password);
  // register new user
  Future<void> signUp(String email, String password, String username);

  /// Store token
  Future<void> setSession(String token);

  /// restore session from token
  Future<UserEntity> restoreSession();

  // check AuthStatus
  Future<UserEntity> checAuthStatus(String token);

// SignUp with credentials
/*
  Future<Either<Failure, bool>> signUp({
    required String email,
    required String password,
    required String username,
  });

  // Verify otp token
  Future<Either<Failure, UserEntity>> verifyOtp(
      {required String email, required String token});

  // SignIn with credentials
  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password});

  /// Sign in with Google
  Future<Either<Failure, bool>> signInWithGoogle();

  /// Sign out
  Future<Either<Failure, bool>> signOut();

  /// Listen to auth changes
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  );

  /// Store token
  Future<void> setSession(String token);

  /// restore session from token
  Future<Either<Failure, UserEntity>> restoreSession();
*/
}
