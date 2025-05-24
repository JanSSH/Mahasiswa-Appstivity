import 'package:flutter/material.dart';

class TentangAplikasi extends StatefulWidget {
  const TentangAplikasi({super.key});

  @override
  State<TentangAplikasi> createState() => _TentangAplikasiState();
}

class _TentangAplikasiState extends State<TentangAplikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Row(
          children: [
            Icon(Icons.person),
            Text("Mahasiswa Aptivity"),
          ],
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person),
          // Image.asset('assets/images/logo-mahasiswa-appstivity.png',),
            //Durung iso Failed to load
            SizedBox(height: 20,),
            Text(
                "Aplikasi sebagai fasilitas\nmonitoring dan pendukung\nkegiatan perkuliahan\nmahasiswa",
              style: TextStyle(
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            Text("Contributor:",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Januar Dwi Putra\nArif Akbarudin\nNurdin Mukti Widodo\nIrsyad Hasan\nMuhammad Syafii", style: TextStyle(),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
