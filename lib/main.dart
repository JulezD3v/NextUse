import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextuse/Account%20and%20Profile/login.dart';    
import 'package:nextuse/Account%20and%20Profile/signup.dart';
import 'package:nextuse/Account%20and%20Profile/splashScreen.dart';   
import 'package:nextuse/MainScreens/homepage.dart';                 
import 'package:nextuse/Features/auth/bloc/auth_bloc.dart';
import 'package:nextuse/Features/auth/data/auth_repo.dart';
import 'package:nextuse/Onboarding_pages/onbd_one.dart';
import 'package:nextuse/Onboarding_pages/onbd_two.dart';  
       

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
        initialRoute: '/splashscreen.dart',
        routes: {
          '/splashscreen': (context) => const SplashScreen(),
          '/onbd_one': (context) => const OnbdOne(),
          '/onbd_two': (context) => const OnbdTwo(),
          '/login': (context) => const Login(),
          '/signup': (context) => const Signup(),
          '/home': (context) => const HomePage(), 
        }
      ),

    );
  }
}