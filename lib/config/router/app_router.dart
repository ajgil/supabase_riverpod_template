import 'package:supabase_riverpod_template/onboarding/views/verify_otp_screen.dart';
import 'package:supabase_riverpod_template/presentations/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/providers/providers.dart';

/* basado en el estado de la auth construimos las rutas dinámicamente */

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authStream = ref.watch(authRepositoryProvider).authState;

  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const Splash(),
      ),
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
    redirect: (context, state) async {
      final isGoingTo = state.matchedLocation;
      await for (final authState in authStream) {
        final loggedIn = authState.session?.user != null;

        print('GoRouter authStatus $loggedIn, location $isGoingTo');

        //if ( isGoingTo == '/splash' && loggedIn == false ) return null;

        if (loggedIn == false) {
          if (isGoingTo == '/login' || isGoingTo == '/register') return null;

          return '/login';
        }

        if (loggedIn == true) {
          if (isGoingTo == '/login' ||
              isGoingTo == '/register' ||
              isGoingTo == '/splash') {
            return '/';
          }
        }
      }
      return null;
    },
  );
}
