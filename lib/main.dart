import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dhvanika/api/firebase_api.dart';
import 'package:dhvanika/blocs/auth/auth_bloc.dart';
import 'package:dhvanika/screens/home_screen.dart';
import 'package:dhvanika/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(authService: FirebaseAPI())..add(CheckAuthStatus())),
      ],
      child: MaterialApp(
        title: 'Dhvanika',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Gabarito',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
