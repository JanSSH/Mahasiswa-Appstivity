import 'package:flutter/material.dart';
import 'package:mahasiswaappstivity/CustomWidget/nav_bar.dart';

class TentangAplikasi extends StatefulWidget {
  const TentangAplikasi({super.key});

  @override
  State<TentangAplikasi> createState() => _TentangAplikasiState();
}

class _TentangAplikasiState extends State<TentangAplikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Text(
          "Mahasiswa Appstivity",

          // untuk desain style appbar
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: NavBar(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/logo-mahasiswa-appstivity.png',),
            //Durung iso Failed to load
            SizedBox(height: 20),
            Container(
              // ukuran box teks bisa padding/margin
              margin: EdgeInsets.symmetric(horizontal: 80),
              // untuk cek ukuran container aktifin warnanya
              //color: Colors.blue,
              child: Text(
                softWrap: true,
                textAlign: TextAlign.center,
                "Aplikasi sebagai fasilitas monitoring dan pendukung kegiatan perkuliahan mahasiswa",
                //ubah desain tulisan
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            SizedBox(height: 20,),

            Text(
              "Contributor:",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),
            Text(
              textAlign: TextAlign.center,
              "Januar Dwi Putra\n"
                  "Arif Akbarudin\n"
                  "Nurdin Mukti Widodo\n"
                  "Irsyad Hasan\n"
                  "Muhammad Syafii",
              //ubah desain tulisan contributor
              style: TextStyle(
                fontSize: 14,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
