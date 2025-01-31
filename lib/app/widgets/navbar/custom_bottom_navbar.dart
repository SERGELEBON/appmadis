import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../pages/home/home_page.dart';
import '../../pages/navbar_pages/bourse_page.dart';
import '../../pages/navbar_pages/budget_page.dart';
import '../../pages/navbar_pages/carte_page.dart';
import '../../pages/navbar_pages/madis_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A1F31), // Couleur de fond de la barre de navigation
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        child: GNav(
          backgroundColor: Color(0xFF1A1F31),
          color: Colors.white, // Couleur des icônes non sélectionnées
          // activeColor: Colors.red,
          tabBackgroundColor: Colors.red.shade50, // Couleur de fond de l'onglet sélectionné
          padding: EdgeInsets.all(10),
          gap: 8,
          selectedIndex: currentIndex,
          onTabChange: onTap,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'L’accueil',
            ),
            GButton(
              icon: Icons.credit_card,
              text: 'La carte',
            ),
            GButton(
              icon: Icons.home, // Placeholder for now
              text: 'Madis',
              leading: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  'assets/images/logoAppBar.png', // Replace with your image asset
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            GButton(
              icon: Icons.bar_chart,
              text: 'Le budget',
            ),
            GButton(
              icon: Icons.show_chart,
              text: 'La bourse',
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartePage(),
    MadisPage(),
    BudgetPage(),
    BoursePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
