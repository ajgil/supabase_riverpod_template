import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_riverpod_template/features/auth/domain/domain.dart';
import 'package:supabase_riverpod_template/features/auth/infraestructure/infraestructure.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  //! Estos métodos terminan delegando en el repositorio
   /// Exposes Supabase auth client to allow Auth Controller to subscribe to auth changes



  final authRepository = AuthRepositoryImpl(supabase.GoTrueClient as supabase.GoTrueClient);
  return AuthNotifier();
});

// state notifier
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  void loginUser(String email, String password) async {}

  void signUp(String email, String password, String username) async {}

  void checkAuthStatus() async {}
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

  AuthState copyWith(AuthStatus? authStatus, UserEntity? userEntity,
          String? errorMessage) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          userEntity: userEntity ?? this.userEntity,
          errorMessage: errorMessage ?? this.errorMessage);
}
