/*import 'package:flutter/material.dart';
import 'package:mobile_wallet/core/services/conn_service.dart';
import 'package:provider/provider.dart';

import '../../../library/common_widgets/app_logo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x0A434740),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/madis_finance.png', height: 100),
              SizedBox(height: 20),
              Text(
                'Connectez-vous !',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            const Text(
              'Gérez parfaitement vos finances - Veuillez entrer vos informations!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 400.0, // Form width constraint to center it
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F31),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTextField(
                      controller: _emailOrPhoneController,
                      labelText: 'Email ou Numéro de téléphone',
                      icon: Icons.person,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _passwordController,
                      labelText: 'Entrez votre mot de passe',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.red;
                            }
                            return Colors.red;
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      onPressed: _isChecked
                          ? () async {
                        final emailOrPhone = _emailOrPhoneController.text.trim();
                        final password = _passwordController.text.trim();
                        final authService = Provider.of<ConnService>(context, listen: false);
                        final success = await authService.login(emailOrPhone, password);
                        if (success) {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          // Show error
                        }
                      }
                          : null,
                      child: Text('Valider'),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login/forgot_password_page');
                      },
                      child: Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Vous ne disposez pas encore d'un compte Madis finance ?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_up/phone_input');
                      },
                      child: Text(
                        'Inscrivez-vous',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white54),
        fillColor: Color(0xFF141724),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_wallet/core/services/conn_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141724),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Image.asset('assets/images/madis_finance.png', height: 100),
              SizedBox(height: 20),
              Text(
                'Connectez-vous !',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Gérez parfaitement vos finances - Veuillez entrer vos informations de connexion ci-dessous',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 400.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F31),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTextField(
                      controller: _emailOrPhoneController,
                      labelText: 'Identifiant',
                      hintText: 'Email ou Numéro de téléphone',
                      icon: Icons.person,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _passwordController,
                      labelText: 'Mot de passe',
                      hintText: 'Entrez votre mot de passe',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.red;
                      }
                      return Colors.red;
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                onPressed: () async {
                  final emailOrPhone = _emailOrPhoneController.text.trim();
                  final password = _passwordController.text.trim();
                  final authService = Provider.of<ConnService>(context, listen: false);
                  final success = await authService.login(emailOrPhone, password);
                  if (success) {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    // Show error
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                  child: Text('Valider', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login/forgot_password_page');
                },
                child: Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Vous ne disposez pas encore d'un compte Madis finance ?",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up/phone_input');
                },
                child: Text(
                  'Inscrivez-vous',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white54),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white54),
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
    );
  }
}
