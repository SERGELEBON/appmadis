import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final TextEditingController _nameController = TextEditingController(text: "Madis");
  final TextEditingController _surnameController = TextEditingController(text: "Finance User");
  final TextEditingController _emailController = TextEditingController(text: "Madis.FinanceUser@outlook.net");
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141724),
      appBar: AppBar(
        backgroundColor: Color(0xFF141724),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Image.asset('assets/images/madis_finance.png', height: 100),
              SizedBox(height: 20),
              Text(
                'Informations personnelles',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: () {
                          // Action pour changer la photo de profil
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildEditableField(_nameController, 'Nom', Icons.edit, TextInputType.text),
              SizedBox(height: 20),
              _buildEditableField(_surnameController, 'Prenom (s)', Icons.edit, TextInputType.text),
              SizedBox(height: 20),
              _buildEditableField(_emailController, 'E-mail', Icons.edit, TextInputType.emailAddress),
              SizedBox(height: 20),
              _buildEditableField(_phoneController, 'Téléphone', null, TextInputType.phone),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  _showUpdateDialog(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(TextEditingController controller, String label, IconData? icon, TextInputType keyboardType) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1A1F31),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: Colors.white54),
                fillColor: Color(0xFF1A1F31),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          if (icon != null)
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: IconButton(
                icon: Icon(icon, color: Colors.white),
                onPressed: () {
                  // Action pour éditer le champ
                },
              ),
            ),
        ],
      ),
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mise à jour"),
          content: Text("Vos données ont été mises à jour"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
