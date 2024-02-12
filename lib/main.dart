import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/config.dart';

Future<void> main() async {
  await dotenv.load();
  String supabaseBaseUrl = dotenv.env['URL'] ?? '';
  String supabaseBaseKey = dotenv.env['ANNON_KEY'] ?? '';
  await Supabase.initialize(url: supabaseBaseUrl, anonKey: supabaseBaseKey);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print environmet api
    // print(Environment.url);
    // provider
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
