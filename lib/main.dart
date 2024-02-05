import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_riverpod_template/config/router/app_router.dart';
import 'package:supabase_riverpod_template/config/theme/app_theme.dart';


Future<void> main() async {
  await Supabase.initialize(
    url: 'https://lbcmuerwfkvbpahbhqgm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxiY211ZXJ3Zmt2YnBhaGJocWdtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ3NjkwMzYsImV4cCI6MjAwMDM0NTAzNn0.Dw_tpKp8wkAtFewRU62JvSG7rOvRnPUwfspuJOt3xVA',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}