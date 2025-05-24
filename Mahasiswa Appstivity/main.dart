import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahasiswaappstivity/MainScreen/Mahasiswa/dashboard_mahasiswa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mahasiswa Appstivity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DashboardMahasiswa(),
    );
  }
}
