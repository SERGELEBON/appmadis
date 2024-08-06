import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FormStep2 extends StatefulWidget {
  final bool isMinor;
  final VoidCallback onSubmit;
  final Function(Map<String, dynamic>) onFormSaved;

  FormStep2({required this.isMinor, required this.onSubmit, required this.onFormSaved});

  @override
  _FormStep2State createState() => _FormStep2State();
}

class _FormStep2State extends State<FormStep2> {
  File? _selfie;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takeSelfie() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _selfie = File(pickedFile.path);
      }
    });
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'svg'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      // Handle the selected file
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _takeSelfie,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[300],
            backgroundImage: _selfie != null ? FileImage(_selfie!) : null,
            child: _selfie == null
                ? Icon(Icons.camera_alt, size: 50, color: Colors.grey[800])
                : Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.edit, size: 30, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 20),
        _buildUploadField('Ajout de la pièce recto'),
        _buildUploadField('Ajout de la pièce verso'),
        _buildUploadField('Ajout de facture'),
        if (widget.isMinor) _buildUploadField('Autorisation parentale'),
        if (widget.isMinor) _buildUploadField('Ajout extrait de naissance'),
        if (widget.isMinor) _buildUploadField('Ajout de pièce d\'un parent proche'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            widget.onSubmit();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text('Valider', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildUploadField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: _pickFile,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1A1F31),
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.cloud_upload, color: Colors.white),
            SizedBox(width: 10),
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
