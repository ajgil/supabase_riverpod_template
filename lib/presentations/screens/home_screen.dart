import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_riverpod_template/config/router/app_router.dart';
import 'package:supabase_riverpod_template/features/auth/presentation/providers/providers.dart';
import 'package:supabase_riverpod_template/features/shared/shared.dart';

// todo - crear consumer widget

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch
    //final user = ref.watch(authUserProvider).asData?.value;

    //print(user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase riverpod App'),
        /*
        actions: [
          if (user != null)
            IconButton(
              onPressed: () => ref.read(authRepositoryProvider).logout(),
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
            )
        ],
        */
      ),
      /*
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            //const Positioned(child: MemoryListView()),
            if (user == null)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: CustomFilledButton(
                  text: 'Login',
                  buttonColor: Colors.black,
                  onPressed: () {
                    // al estar dentro de funciones siempre usamos read, no watch
                    ref.read(appRouterProvider).push('/login');
                    //context.push('/login');
                  },
                ),
              ),
          ],
        ),
      ),
    */
    body: const Center(
        child: Text('dentro'),
      ),
    );
  }
}
