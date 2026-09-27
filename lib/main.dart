import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesba/core/network/supabase/supabase_manager.dart';
import 'injection_container.dart' as di;

import 'features/signin/presentation/cubit/signin_cubit.dart';
import 'features/signup/presentation/cubit/signup_cubit.dart';
import 'features/splash/presentation/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Supabase
  await SupabaseManager.initialize();
  
  // 2. Initialize Dependency Injection
  await di.init();

  // 3. Inject Providers
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<SigninCubit>()),
        BlocProvider(create: (context) => di.sl<SignupCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeWise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1C2B39)),
        useMaterial3: true,
        fontFamily: 'Cairo', // We can update this later when fonts are added
      ),
      home: const SplashScreen(),
    );
  }
}
