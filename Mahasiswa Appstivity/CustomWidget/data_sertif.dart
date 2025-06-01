import 'package:flutter/material.dart';

class DataSertif extends StatefulWidget {
  const DataSertif({super.key});

  @override
  State<DataSertif> createState() => _DataSertifState();
}

class _DataSertifState extends State<DataSertif> {
  List<bool> _expandedProdi1 = [];
  List<bool> _expandedProdi2 = [];

  final List<Map<String, dynamic>> dataProdi1 = [
    {
      'nim': '230101010',
      'nama': 'Username mhs1',
      'email': 'email1@email.com',
      'hp': '081818888198',
      'sertifikat': [
        'Sertifikat Webinar blablabla',
        'Sertifikat Seminar Ceria',
        'Sertifikat CCNA',
        'Sertifikat Tanah',
      ],
    },
    {
      'nim': '230101010',
      'nama': 'Username mhs2',
      'email': 'email2@email.com',
      'hp': '081818888198',
      'sertifikat': [
        'Sertifikat Webinar blablabla',
        'Sertifikat Seminar Ceria',
      ],
    },
  ];

  final List<Map<String, dynamic>> dataProdi2 = [
    {
      'nim': '230101010',
      'nama': 'Username mhs3',
      'email': 'email3@email.com',
      'hp': '081818888198',
      'sertifikat': [
        'Sertifikat CCNA',
        'Sertifikat Tanah',
      ],
    },
    {
      'nim': '230101010',
      'nama': 'Username mhs4',
      'email': 'email4@email.com',
      'hp': '081818888198',
      'sertifikat': [
        'Sertifikat Webinar blablabla',
        'Sertifikat Seminar Ceria',
        'Sertifikat CCNA',
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _expandedProdi1 = List.generate(dataProdi1.length, (_) => false);
    _expandedProdi2 = List.generate(dataProdi2.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Sertifikat Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProdiContainer('Prodi1', dataProdi1, _expandedProdi1),
            SizedBox(height: 16),
            _buildProdiContainer('Prodi2', dataProdi2, _expandedProdi2),
          ],
        ),
      ),
    );
  }

  Widget _buildProdiContainer(
      String prodiTitle,
      List<Map<String, dynamic>> dataMahasiswa,
      List<bool> expandedList) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            prodiTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 12),
          ...List.generate(dataMahasiswa.length, (index) {
            final data = dataMahasiswa[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NIM header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      'NIM | ${data['nim']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  // Mahasiswa card
                  InkWell(
                    onTap: () {
                      setState(() {
                        expandedList[index] = !expandedList[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Foto profil placeholder
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          SizedBox(width: 12),
                          // Data mahasiswa
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['nama'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(data['email']),
                                Text('No. hp : ${data['hp']}'),
                                SizedBox(height: 8),
                                Text(
                                  '${data['sertifikat'].length} Sertifikat Terkumpul',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 4),
                                LinearProgressIndicator(
                                  value: data['sertifikat'].length / 5,
                                  backgroundColor: Colors.grey[400],
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (expandedList[index]) ...[
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: data['sertifikat']
                            .map<Widget>(
                              (sertif) => Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Expanded(child: Text(sertif)),
                                InkWell(
                                  onTap: () {
                                    // Aksi lihat sertifikat
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Lihat Sertifikat: $sertif')),
                                    );
                                  },
                                  child: Text(
                                    'Lihat Sertif',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                            .toList(),
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
