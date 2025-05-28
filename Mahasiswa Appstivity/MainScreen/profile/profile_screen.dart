import 'package:flutter/material.dart';
import 'package:profile/edit_profil_screen.dart';
import 'widget/info_card.dart';
import 'widget/info_row.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF5A52E5),
        title: Row(
          children: [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilScreen()),
                );
              },
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 18),
            CircleAvatar(
              radius: 64,
              backgroundColor: Color(0xFF5A52E5),
              child: Icon(Icons.person, size: 66, color: Colors.white),
            ),

            SizedBox(height: 16),

            Text(
              'USERNAME',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              'mahasiswa@gmail.com',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),

            SizedBox(height: 18),

            InfoCard(
              title: Row(
                children: [
                  Icon(Icons.edit, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    'BIO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    'Ceritakan sedikit tentang dirimu...',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            InfoCard(
              title: Row(
                children: [
                  Icon(Icons.school, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    'RIWAYAT PENDIDIKAN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              children: [
                InfoRow(label: 'NIM', value: ''),
                InfoRow(label: 'KELAS', value: ''),
                InfoRow(label: 'SEMESTER', value: ''),
                InfoRow(label: 'PROGRAM STUDI', value: ''),
              ],
            ),

            SizedBox(height: 16),

            InfoCard(
              title: Row(
                children: [
                  Icon(Icons.person_pin, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    'DATA PRIBADI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              children: [
                InfoRow(label: 'TANGGAL LAHIR', value: ''),
                InfoRow(label: 'JENIS KELAMIN', value: ''),
                InfoRow(label: 'ALAMAT', value: ''),
                InfoRow(label: 'NO.HP', value: ''),
              ],
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
