import 'package:supabase_riverpod_template/onboarding/views/verify_otp_screen.dart';
import 'package:supabase_riverpod_template/presentations/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
 
    GoRoute(
      path: '/verify',
      builder: (context, state) {
        final params = state.extra as VerifyOtpParams?;

        if (params == null) {
          throw 'Missing `Verification OTP Params` object';
        }

        return VerifyOtpScreen(params: params);
      },
    ),
    
  ],
);
