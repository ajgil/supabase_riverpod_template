import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_riverpod_template/features/auth/domain/domain.dart';
import 'package:supabase_riverpod_template/features/auth/infraestructure/infraestructure.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  //! Estos métodos terminan delegando en el repositorio
  /// Exposes Supabase auth client to allow Auth Controller to subscribe to auth changes

  final authRepository =
      AuthRepositoryImpl(supabase.GoTrueClient as supabase.GoTrueClient);

  return AuthNotifier(authRepository: authRepository);
});

// state notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthNotifier({required this.authRepository}) : super(AuthState());

  void singIn(String email, String password) async {
    try {
      final userEntity = await authRepository.signIn(email, password);

      _setLoggedUser(userEntity);
    } on WrongCredentials {
      signOut('Credenciales incorrectas');
    } catch (e) {
      signOut(
          'Se ha producido un error inesperado. Por favor prueba en unos minutos');
    }
  }

  void signUp(String email, String password, String username) async {}

  void checkAuthStatus() async {}

  void _setLoggedUser(UserEntity userEntity) {
    // Todo: almacenar token
    state = state.copyWith(
      userEntity: userEntity,
      authStatus: AuthStatus.authenticated,
    );
  }

  Future<void> signOut([String? errorMessage]) async {
    // todo: limpiar token
    state = state.copyWith(
      authStatus: AuthStatus.notAutenticated,
      userEntity: null,
      errorMessage: errorMessage,
    );
  }
}

enum AuthStatus { checking, authenticated, notAutenticated }

class AuthState {
  final AuthStatus authStatus;
  final UserEntity? userEntity;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.userEntity,
      this.errorMessage = ''});

  AuthState copyWith(
          {AuthStatus? authStatus,
          UserEntity? userEntity,
          String? errorMessage}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          userEntity: userEntity ?? this.userEntity,
          errorMessage: errorMessage ?? this.errorMessage);
}
