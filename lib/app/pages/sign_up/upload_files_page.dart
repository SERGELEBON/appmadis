/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadFilePage extends StatefulWidget {
  @override
  _UploadFilePageState createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  bool _isAccepted = false;
  bool _isMinor = false;
  DateTime? _dob;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _dob = (userDoc['dob'] as Timestamp).toDate();
          if (_dob != null) {
            final age = DateTime.now().year - _dob!.year;
            _isMinor = age < 18;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Upload Files'),
      ),
      body: _dob == null
          ? Center(child: CircularProgressIndicator())
          : Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFF141724),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.red, size: 30),
                    onPressed: () {
                      // Code pour télécharger la photo de profil
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Madis Finance',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  'Cliquez sur le cercle afin de charger votre photo\nqui sera utilisée comme votre photo de profil',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                _buildUploadButton('Insérer votre pièce recto'),
                _buildUploadButton('Insérer votre pièce verso'),
                _buildUploadButton('Insérer une facture SODECI/CIE'),
                _buildUploadButton('Insérer le document', disabled: !_isMinor),
                _buildUploadButton('Insérer votre extrait de naissance', disabled: !_isMinor),
                _buildUploadButton('Insérer une pièce d\'identité', disabled: !_isMinor),
                SizedBox(height: 20),
                CheckboxListTile(
                  title: GestureDetector(
                    onTap: () {
                      // Code pour afficher les conditions d'utilisation
                    },
                    child: Text(
                      'J\'accepte les conditions d\'utilisation',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  value: _isAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAccepted = value ?? false;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isAccepted ? _validateForm : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isAccepted ? Colors.red : Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Valider', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton(String text, {bool disabled = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: disabled ? null : () {
          // Code pour télécharger le fichier
        },
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
            Text(text, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void _validateForm() {
    // Rediriger vers la page de bienvenue
    Navigator.pushNamed(context, '/home');
  }
}
 */
