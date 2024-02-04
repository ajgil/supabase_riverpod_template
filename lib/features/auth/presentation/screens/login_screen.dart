import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_riverpod_template/features/shared/shared.dart';
import 'package:supabase_riverpod_template/onboarding/onboarding.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
// propiedades
  bool _isSubmitting = false;

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _username = TextEditingController();

// Funcion login
  Future<void> _login() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      /*
      await ref.read(authRepositoryProvider).logIn(
            email: _email.text,
            password: _password.text,
          );
*/
      if (mounted) {
        context.pop();
      }
    } catch (e) {
      setState(() {
        _isSubmitting = false;
      });

      //context.showAlert(e.toString());
    }
  }

// Funcion create account
  Future<void> _signUp() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(onBoardingRepositoryProvider).signUp(
            email: _email.text,
            password: _password.text,
            username: _username.text,
          );

      if (mounted) {
        context.push(
          '/verify',
          extra: VerifyOtpParams(
            email: _email.text,
            password: _password.text,
            username: _username.text,
          ),
        );
      }
    } catch (e) {
      //context.showAlert(e.toString());
    }

    setState(() {
      _isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: GeometricalBackground(
              child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            // Icon Banner
            const Icon(
              Icons.add_home_work_sharp,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 80),

            Container(
                height: size.height - 260, // 80 los dos sizebox y 100 el ícono
                width: double.infinity,
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                //child: const _LoginForm(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Text('Login', style: textStyles.titleLarge),
                      const SizedBox(height: 90),
                      const CustomTextFormField(
                        label: 'Correo',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      const CustomTextFormField(
                        label: 'Contraseña',
                        obscureText: true,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: CustomFilledButton(
                            text: 'Entrar',
                            buttonColor: Colors.black,
                            onPressed: _isSubmitting
                                ? null
                                : () {
                                    _login();
                                  },
                          )),
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('¿No tienes cuenta?'),
                          TextButton(
                              onPressed: _isSubmitting
                                  ? null
                                  : () {
                                      _signUp();
                                    },
                              //onPressed: () => context.push('/signup'),
                              child: const Text('Crea una aquí'))
                        ],
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ))
          ],
        ),
      ))),
    );
  }
}

/*
class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Login', style: textStyles.titleLarge),
          const SizedBox(height: 90),
          const CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Entrar',
                buttonColor: Colors.black,
                onPressed: _isSubmitting ? null : () {

                },
              )),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿No tienes cuenta?'),
              TextButton(
                  onPressed: () => context.push('/signup'),
                  child: const Text('Crea una aquí'))
            ],
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

}
*/