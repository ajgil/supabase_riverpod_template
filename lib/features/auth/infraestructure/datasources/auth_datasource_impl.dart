import 'package:supabase_riverpod_template/features/auth/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:supabase_riverpod_template/features/auth/infraestructure/infraestructure.dart';

class AuthDatasourceImpl extends AuthDatasource {
  //! aqui es donde realizamos el proceso para verificar token y los metodos de login y signup

  /// Exposes Supabase auth client to allow Auth Controller to subscribe to auth changes
  final supabase.GoTrueClient authClient;

  // constructor
  AuthDatasourceImpl(this.authClient);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    try {
      final response =
          await authClient.signInWithPassword(email: email, password: password);
      final user = UserMapper.userJsonToEntity(response.user as Map<String, dynamic>);
      return user;
    } catch (e) {
      throw WrongCredentials();
    }
  }

  @override
  Future<UserEntity> checAuthStatus(String token) {
    // TODO: implement checAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> restoreSession() {
    // TODO: implement restoreSession
    throw UnimplementedError();
  }

  @override
  Future<void> setSession(String token) {
    // TODO: implement setSession
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(String email, String password, String username) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
