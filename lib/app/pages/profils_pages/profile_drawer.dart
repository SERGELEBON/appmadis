import 'package:flutter/material.dart';
import 'package:mobile_wallet/app/pages/profils_pages/privacy_policy/privacy_policy_page.dart';
import 'package:mobile_wallet/app/pages/profils_pages/rapport/support_page.dart';
import '../../../library/common_widgets/app_logo.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';
import 'faq_page/faq_page.dart';
import 'info_personel/personal_info_page.dart';


class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF0A434740),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SingleChildScrollView(
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F31),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile_pic.png'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to profile edit page
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.edit, color: Colors.white, size: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Guehi Serge',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '(+225) 07 07 07 07 07',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black54),
              title: Text('Accueil', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black54),
              title: Text('Informations personnelles', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to personal information page
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonalInfoPage()),
                 );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box, color: Colors.black54),
              title: Text('Informations du compte', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to account information page
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.black54),
              title: Text('Espace pro', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to professional space page
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart, color: Colors.black54),
              title: Text('Espace bourse', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to stock space page
              },
            ),
            ListTile(
              leading: Icon(Icons.savings, color: Colors.black54),
              title: Text('Espace Epargne +', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to savings space page
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet, color: Colors.black54),
              title: Text('Budget', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to budget page
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.black54),
              title: Text('Acheter du crédit', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to credit purchase page
              },
            ),
            ListTile(
              leading: Icon(Icons.group_add, color: Colors.black54),
              title: Text('Créer une cagnotte', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to create a kitty page
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.black54),
              title: Text('FAQ', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to budget page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.black54),
              title: Text('Politique de confidentialité', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to credit purchase page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                );

              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support, color: Colors.black54),
              title: Text('Support', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to create a kitty page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black54),
              title: Text('Déconnexion', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Déconnexion et redirection vers la page de connexion
                _logout(context);
              },
            ),
          ],
        ),

      ),
    );
  }

  void _logout(BuildContext context) {
    // Ajoutez ici la logique de déconnexion (par exemple, suppression des jetons d'authentification)

    // Redirigez vers la page de connexion
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
