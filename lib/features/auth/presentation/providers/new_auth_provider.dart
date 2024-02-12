import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_riverpod_template/features/auth/domain/domain.dart';

enum AuthStatus { checking, authenticated, notAutenticated }

@riverpod
class AuthState {
  final AuthStatus authStatus;
  final UserEntity? userEntity;
  final String errorMessage;

  AuthState({this.authStatus = AuthStatus.checking, this.userEntity, this.errorMessage = ''});
}
