import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch/core/theme/app_theme.dart';
import 'package:flutter_bloc_clean_arch/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter_bloc_clean_arch/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_bloc_clean_arch/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => sl<AuthBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: const SignupPage(),
    );
  }
}
