import 'package:flutter/material.dart';
import 'package:profile/widget/custom_dropdown_edit.dart';
import 'package:profile/widget/custom_gender_edit.dart';
import 'package:profile/widget/custom_sectioncard_edit.dart';
import 'package:profile/widget/custom_textfield_edit.dart';

class EditProfilScreen extends StatefulWidget {
  EditProfilScreen({Key? key}) : super(key: key);

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  final _namaController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nimController = TextEditingController();
  final _bioController = TextEditingController();
  final _noHpController = TextEditingController();

  String? _selectedGender;
  String? _selectedProdi;
  String? _selectedSemester;
  DateTime? _selectedDate;

  final List<String> _prodiList = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Komputer',
  ];
  final List<String> _semesterList = List.generate(
    8,
    (index) => 'Semester ${index + 1}',
  );

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _pickImage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fitur unggah foto belum diimplementasikan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 246, 249),

      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Edit Profil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF5A52E5),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Implement save logic
            },
            child: Text(
              'Simpan',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(
                      'assets/',
                    ), // Ganti dengan gambar profil default
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Username field
            CustomTextfieldEdit(
              labelText: 'Username',
              hintText: 'Masukkan username',
              controller: _usernameController,
            ),
            SizedBox(height: 12),

            // Bio field
            CustomTextfieldEdit(
              labelText: 'Bio',
              hintText: 'Masukkan bio singkat',
              maxLines: 3,
              controller: _bioController,
            ),
            SizedBox(height: 20),

            // SECTION: Pendidikan
            CustomSectioncardEdit(
              title: 'Pendidikan',
              children: [
                CustomTextfieldEdit(
                  labelText: 'NIM',
                  hintText: 'Masukkan nim',
                  controller: _nimController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),
                CustomTextfieldEdit(
                  labelText: 'Kelas',
                  hintText: 'Masukkan kelas',
                  controller: _nimController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),
                CustomDropdownEdit(
                  labelText: 'Semester',
                  hintText: 'Pilih Semester',
                  value: _selectedSemester,
                  items: _semesterList,
                  onChanged: (val) => setState(() => _selectedSemester = val),
                ),
                SizedBox(height: 12),
                CustomDropdownEdit(
                  labelText: 'Program Studi',
                  hintText: 'Pilih Program Studi',
                  value: _selectedProdi,
                  items: _prodiList,
                  onChanged: (val) => setState(() => _selectedProdi = val),
                ),
              ],
            ),

            SizedBox(height: 20),

            // SECTION: Data Pribadi
            CustomSectioncardEdit(
              title: 'Data Pribadi',
              children: [
                GestureDetector(
                  onTap: _pickDate,
                  child: AbsorbPointer(
                    child: CustomTextfieldEdit(
                      labelText: 'Tanggal Lahir',
                      hintText:
                          _selectedDate == null
                              ? 'Pilih tanggal lahir'
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    ),
                  ),
                ),
                SizedBox(height: 12),
                CustomGenderEdit(
                  selectedGender: _selectedGender,
                  onChanged: (val) => setState(() => _selectedGender = val),
                ),
                SizedBox(height: 12),
                CustomTextfieldEdit(
                  labelText: 'Alamat',
                  hintText: 'Masukkan alamat',
                  controller: _namaController,
                ),

                SizedBox(height: 12),
                CustomTextfieldEdit(
                  labelText: 'No. HP',
                  hintText: 'Masukkan nomor handphone',
                  keyboardType: TextInputType.phone,
                  controller: _noHpController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
