import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'onboarding_provider.g.dart';

// exponer el provider
@riverpod
OnBoardingRepository onBoardingRepository(_) => OnBoardingRepository();

class OnBoardingRepository {
  final _client = Supabase.instance.client;

  // declaramos algunos bool para capturar errores
  
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    return _client.auth.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );
  }

  Future<AuthResponse> verifyCode({
    required String email,
    required String code,
  }) async {
    return _client.auth.verifyOTP(
      email: email,
      token: code,
      type: OtpType.signup,
    );
  }
}
