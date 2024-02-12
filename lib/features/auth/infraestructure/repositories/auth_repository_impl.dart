import 'package:supabase_riverpod_template/features/auth/domain/domain.dart';
import '../infraestructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  // la idea es que facilmente podamos hacer cambios en los datasources
  //
  final AuthDatasource dataSource;

  AuthRepositoryImpl(AuthDatasource? dataSource)
      : dataSource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<UserEntity> checAuthStatus(String token) {
    return dataSource.checAuthStatus(token);
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
  Future<UserEntity> signIn({required String email, required String password}) {
    return dataSource.signIn(email, password);
  
  }
}