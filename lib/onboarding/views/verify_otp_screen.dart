import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_riverpod_template/features/shared/shared.dart';

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


class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({required this.params, super.key});

  final VerifyOtpParams params;


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
              child: const _VerifyOtpForm(),
            )
          ],
        ),
      ))),
    );
  }
}

class _VerifyOtpForm extends StatelessWidget {
  const _VerifyOtpForm();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: [
          const SizedBox(height: 50),
          Text('Introduce el código recibido', style: textStyles.titleMedium),
          const SizedBox(height: 50),
          const CustomTextFormField(
              label: 'Codigo Otp', keyboardType: TextInputType.number),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Verificar',
                buttonColor: Colors.black,
                onPressed: () {},
              )),
          const Spacer(flex: 2),
        ]));
  }
}
