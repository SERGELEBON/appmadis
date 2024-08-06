/*import 'package:flutter/material.dart';
import 'package:mobile_wallet/app/app.dart';
import 'package:mobile_wallet/library/common_widgets/app_colors.dart';
import '../../../core/utils/theme_service.dart';
import '../../../library/common_widgets/app_logo.dart';
import '../../../library/common_widgets/app_text_styles.dart';
import '../../widgets/custom_button.dart';

class SignUpWelcomePage extends StatelessWidget { SignUpWelcomePage({Key? key}) : super(key: key);
  final ThemeService _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Madis Finance'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              ThemeMode currentMode = _themeService.getThemeMode();
              ThemeMode newMode = currentMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
              _themeService.saveThemeMode(newMode);
              MyApp(); // Rebuild the app to apply the new theme
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(),
            const SizedBox(height: 20),
            const Text(
              'Bienvenue sur Madis Finance!',
              style: AppTextStyles.headerStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Votre inscription est complète. Gérez parfaitement vos finances avec notre plateforme.',
              style: AppTextStyles.subHeaderStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Commencer',
              onPressed: () {
                // Ajouter la logique pour envoyer le code OTP via Firebase ici
                Navigator.pushNamed(context, '/sign_up/otp_verification');
              },
            ),
          ],
        ),
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';
import 'package:mobile_wallet/library/common_widgets/app_logo.dart';
import 'package:mobile_wallet/library/common_widgets/buttons.dart';

import '../../../library/common_widgets/app_text_styles.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fond2.png'), // Image de fond
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo
                  AppLogo(),
                  const SizedBox(height: 5),
                  // Splash image
                  Image.asset(
                    'assets/images/splash.png', // Assurez-vous que le chemin de l'image est correct
                    height: 200, // Ajustez la hauteur selon vos besoins
                  ),
                  const SizedBox(height: 5),
                  // Welcome text
                  const Text(
                    'Bienvenue !',
                    style: AppTextStyles.welcomeTextStyle,
                  ),
                  const SizedBox(height: 10),
                  // Description text
                  const Text(
                    'Gérez parfaitement vos finances avec l\'application mobile Madis Finance',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.descriptionTextStyle,
                  ),
                  const SizedBox(height: 20),
                  // Inscription button
                  PrimaryButton(
                    text: 'Inscription',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign_up/phone_input');
                    },
                  ),
                  const SizedBox(height: 15),
                  // Connexion button
                  PrimaryButton(
                    text: 'Connexion',
                    onPressed: () {
                      Navigator.pushNamed(context, '/login/login_page');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
