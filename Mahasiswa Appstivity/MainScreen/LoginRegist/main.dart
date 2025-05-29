import 'package:loginprojek/login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MahasiswaApp());
}

class MahasiswaApp extends StatelessWidget {
  const MahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahasiswa Activity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      ),
      home:const LoginScreen(),
      routes: {
        // '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
