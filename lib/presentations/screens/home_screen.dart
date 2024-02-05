import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_riverpod_template/features/auth/presentation/providers/providers.dart';

// todo - crear consumer widget

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch
    final user = ref.watch(authUserProvider).asData?.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase riverpod template App'),
        actions: [
          if (user != null)
            IconButton(
              onPressed: () => ref.read(authRepositoryProvider).logout(),
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
            )
        ],
      ),
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
                child: FilledButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  child: const Text('Login'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
