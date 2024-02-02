import 'package:supabase_riverpod_template/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:supabase_riverpod_template/presentations/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
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
      builder: (context, state) => const VerifyOtpScreen(),
    ),
    
  ],
);
