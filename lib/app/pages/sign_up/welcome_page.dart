// lib/app/pages/sign_up/welcome_page.dart
import 'package:flutter/material.dart';
import 'package:mobile_wallet/app/pages/home/home_page.dart';
import 'package:mobile_wallet/library/common_widgets/app_logo.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/madis_finance.png', height: 100),
            const SizedBox(height: 20),
            Image.asset('assets/images/economies.png', height: 150), // Remplacez par votre image
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:  Color(0xFF1A1F31), // Couleur de fond de la zone de texte
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    'Bienvenue !',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Madis Finance',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Votre inscription a été enregistrée ! Veuillez vous connecter à votre compte en cliquant sur le bouton ci-dessous.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Naviguer vers la page d'accueil
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Couleur du bouton
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      child: Text('Commencez',
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
