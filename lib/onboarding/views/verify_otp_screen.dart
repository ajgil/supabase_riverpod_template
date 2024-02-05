import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_riverpod_template/features/shared/shared.dart';

import '../providers/onboarding_provider.dart';

class VerifyOtpParams {
  const VerifyOtpParams({
    required this.email,
    required this.password,
    required this.username,
  });

  final String email;
  final String password;
  final String username;
}


class VerifyOtpScreen extends ConsumerStatefulWidget {
  const VerifyOtpScreen({required this.params, super.key});

  final VerifyOtpParams params;
  
  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreen();
}

class _VerifyOtpScreen extends ConsumerState<VerifyOtpScreen> {
bool _isSubmitting = false;
final _code = TextEditingController();


// metodo verificar codigo
    Future<void> _verify() async {
       try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(onBoardingRepositoryProvider).verifyCode(
            email: widget.params.email,
            code: _code.text,
          );

      if (mounted) {
        //context.showAlert('Successfully signed up');

        context.go('/');
      }
    } catch (e) {
      setState(() {
        _isSubmitting = false;
      });

      //context.showAlert(e.toString());
    }
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
                        size: 40, color: Color.fromRGBO(255, 255, 255, 1))),
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
        child: Column(children: [
          const SizedBox(height: 50),
          Text('Introduce el código recibido', style: textStyles.titleMedium),
          const SizedBox(height: 50),
          CustomTextFormField(
              controller: _code,
              onChanged: (code) {
                print('Code text field: $code (${code.characters.length})');
              },
              label: 'Codigo Otp', keyboardType: TextInputType.number),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Verificar',
                buttonColor: Colors.black,
                onPressed: _isSubmitting
                              ? null
                              : () {
                                  _verify();
                                },
                        )),
              
          const Spacer(flex: 2),
        ])),
            ),
          ],
        ),
      ))),
    );

  }
  
}
