import 'package:flutter/material.dart';

class CustomGenderEdit extends StatelessWidget {
  final String? selectedGender;
  final Function(String?) onChanged;

  const CustomGenderEdit({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Kelamin',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: selectedGender == 'Laki-laki' 
                      ? Color(0xFF6366F1).withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Radio<String>(
                      value: 'Laki-laki',
                      groupValue: selectedGender,
                      activeColor: Color(0xFF6366F1),
                      onChanged: onChanged,
                    ),
                    Text('Laki-laki'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: selectedGender == 'Perempuan' 
                      ?  Color(0xFF6366F1).withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Radio<String>(
                      value: 'Perempuan',
                      groupValue: selectedGender,
                      activeColor: Color(0xFF6366F1),
                      onChanged: onChanged,
                    ),
                    Text('Perempuan'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
