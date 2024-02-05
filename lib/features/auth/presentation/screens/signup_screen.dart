import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_riverpod_template/features/shared/shared.dart';
import 'package:supabase_riverpod_template/onboarding/onboarding.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  // propiedades
  bool _isSubmitting = false;

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _username = TextEditingController();
  // metodos
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

    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textStyles = Theme.of(context).textTheme;

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (!context.canPop()) return;
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back_rounded,
                        size: 40, color: Colors.white)),
                const Spacer(flex: 1),
                Text('Crear cuenta',
                    style:
                        textStyles.titleLarge?.copyWith(color: Colors.white)),
                const Spacer(flex: 2),
              ],
            ),

            const SizedBox(height: 50),

            Container(
              height: size.height - 260, // 80 los dos sizebox y 100 el ícono
              width: double.infinity,
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text('Nueva cuenta', style: textStyles.titleMedium),
                    const SizedBox(height: 40),
                     CustomTextFormField(
                      controller: _username,
                      onChanged: (code) {
                print('Code text field: $_username (${_username})');
              },
                      label: 'Nombre de usuario',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                     CustomTextFormField(
                      controller: _email,
                      label: 'Correo',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                     CustomTextFormField(
                      controller: _password,
                      label: 'Contraseña',
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                     CustomTextFormField(
                      controller: _password,
                      label: 'Repita la contraseña',
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: CustomFilledButton(
                          text: 'Crear',
                          buttonColor: Colors.black,
                          onPressed: _isSubmitting
                              ? null
                              : () {
                                  _signUp();
                                },
                        )),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿Ya tienes una cuenta?'),
                        TextButton(
                            onPressed: () {
                              if (context.canPop()) {
                                return context.pop();
                              }
                              context.go('/login');
                            },
                            child: const Text('Haz login aquí')),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ))),
    );
  }
}
