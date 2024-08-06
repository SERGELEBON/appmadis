import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/utils/theme_service.dart';
import '../../../library/common_widgets/app_logo.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _phoneController = TextEditingController();
  final String _selectedCountryCode = '+225';
  final bool _isCodeSent = false;
  String? _verificationId;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final themeService = Provider.of<ThemeService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0A434740),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0x0A434740),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Inscrivez votre contact maintenant et vous recevrez un code pour reinitialiser votre mot de passe !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 70),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F31),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: Colors.white),
                    labelText: 'Numéro de téléphone',
                    hintText: 'Entrez votre numéro de téléphone',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  if (_phoneController.text.length == 10) {
                    _verifyPhoneNumber(authService);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Le numéro doit contenir exactement 10 chiffres')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                  child: const Text(
                    'Suivant',
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

  void _verifyPhoneNumber(AuthService authService) {
    String phoneNumber = '$_selectedCountryCode${_phoneController.text}';
    authService.verifyPhoneNumber(
      phoneNumber,
          (verificationId) {
        Navigator.pushNamed(context, '/login/reset_password_page', arguments: verificationId);
      },
          (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Échec de la vérification: $error')),
        );
      },
          (verificationId) {},
    );
  }
}
