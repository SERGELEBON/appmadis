import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/utils/theme_service.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final TextEditingController _codeController = TextEditingController();
  late String _verificationId = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _verificationId = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final themeService = Provider.of<ThemeService>(context);

    return Scaffold(
      backgroundColor: Color(0xFF41724),
      appBar: AppBar(
        backgroundColor: Color(0x0A434740),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/madis_finance.png', height: 150),
              const SizedBox(height: 40),
              const Text(
                'Gérez parfaitement vos finances - Inscrivez-vous maintenant à notre plateforme Madis finance !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return _buildCodeBox(index);
                }),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _signInWithPhoneNumber(authService);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                  child: const Text(
                    'Vérifier le code',
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

  Widget _buildCodeBox(int index) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF1A1F31),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: TextEditingController(),
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
          _codeController.text = _codeController.text + value;
        },
      ),
    );
  }

  void _signInWithPhoneNumber(AuthService authService) async {
    User? user = await authService.signInWithPhoneNumber(_verificationId, _codeController.text);
    if (user != null) {
      Navigator.pushNamed(context, '/sign_up/form');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erreur de vérification du code')),
      );
    }
  }
}
