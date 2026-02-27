import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextuse/Account%20and%20Profile/login.dart';    
import 'package:nextuse/Account%20and%20Profile/signup.dart';   
import 'package:nextuse/Screen/homepage.dart';                 
import 'package:nextuse/Features/auth/bloc/auth_bloc.dart';
import 'package:nextuse/Features/auth/data/auth_repo.dart';  
       

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthRepository(), // this must point to your auth_repository.dart
          ),
        ),

      ],
      child: MaterialApp(
        title: 'NextUse',
        debugShowCheckedModeBanner: false,
       theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

        // Named routes - make sure all pages are accessible
        initialRoute: '/login',
        routes: {
          '/login': (context) => const Login(),
          '/signup': (context) => const Signup(),
          '/home': (context) => const HomePage(),  
        },
      ),
    );
  }
}