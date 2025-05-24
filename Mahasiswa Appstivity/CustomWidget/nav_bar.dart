import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahasiswaappstivity/MainScreen/Mahasiswa/dashboard_mahasiswa.dart';
import 'package:mahasiswaappstivity/MainScreen/Mahasiswa/profiles_mahasiswa.dart';
import 'package:mahasiswaappstivity/MainScreen/Mahasiswa/sertifikat_storage.dart';
import 'package:mahasiswaappstivity/MainScreen/ScreenSecond/tentang_aplikasi.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // username dan email ambil dari database ($email, $username)
            accountName: Text('Username'),
            accountEmail: Text('Email@gmail.com'),

            //untuk desain foto profile
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(
                  Icons.person,
                  size: 36,
                ),
              ),
            ),
            // Desain background navbar
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/Images/Logo_Mahasiswa_Appstivity.png'),
              ),
              color: Colors.blue,
            ),
          ),

          //Dashboard
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => Get.to(DashboardMahasiswa()),
          ),

          //Profile
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => Get.to(ProfilesMahasiswa()),
          ),

          //Sertifikat
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Sertifikat'),
            onTap: () => Get.to(SertifikatStorage()),
          ),

          //Tentang Aplikasi
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Tentang Aplikasi'),
            onTap: () => Get.to(TentangAplikasi()),
          ),


        ],
      ),
    );
  }
}
