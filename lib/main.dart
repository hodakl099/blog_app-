import 'package:blog_app/core/theme/app_theme.dart';
import 'package:blog_app/features/auth/presentataion/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentataion/pages/login_page.dart';
import 'package:blog_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

//initialize dependcies.
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (_) => serviceLocator<AuthBloc>())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<AuthBloc>().add(IsUserLoggedIn());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const SigninPage(),
    );
  }
}
