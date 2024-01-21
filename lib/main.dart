import 'package:flutter/material.dart';
import 'package:movieapp/screens/detail/detail.dart';
import 'package:movieapp/screens/favorite/favorite_screen.dart';
import 'package:movieapp/screens/home/home_screen.dart';
import 'package:movieapp/screens/landing/landing.dart';
import 'package:movieapp/screens/login/login_screen.dart';
import 'package:movieapp/screens/main/main_screen.dart';
import 'package:movieapp/screens/profile/profile_screen.dart';
import 'package:movieapp/screens/search/search_screen.dart';
import 'package:movieapp/screens/signup/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: const ColorScheme.dark(
              background: Colors.black,
              primary: Color.fromRGBO(50, 168, 115, 1)),
          useMaterial3: true,
        ),
        color: Colors.white,
        home: const LandingScreen(),
        routes: {
          '/landing': (context) => const LandingScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/main': (context) => const MainScreen(),
          '/home': (context) => HomeScreen(),
          '/search': (context) => const SearchScreen(),
          '/favorite': (context) => const FavoriteScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/detail': (context) => const DetailScreen()
        });
  }
}
