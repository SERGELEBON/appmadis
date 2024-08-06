/*import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/activity_tile.dart';
import 'madis_store_pages/madistore_page.dart';
import 'market_pages/market_news_page.dart';
import 'market_pages/promo_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A434740),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F31),
        title: Text('Madis Finance'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.notifications, color: Colors.white),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            onPressed: () {
              // Handle notifications
            },
          ),
          GestureDetector(
            onTap: () {
              // Handle profile menu
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1A1F31),
              ),
              child: Text(
                'Madis Finance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('La carte'),
              onTap: () {
                // Handle card page
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Madis'),
              onTap: () {
                // Handle Madis page
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Le budget'),
              onTap: () {
                // Handle budget page
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart),
              title: Text('La bourse'),
              onTap: () {
                // Handle bourse page
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBalanceCard(),
              SizedBox(height: 20),
              _buildRecentActivities(),
              SizedBox(height: 20),
              _buildPatrimoineSection(context),
              SizedBox(height: 20),
              _buildMadistoreSection(context),
              SizedBox(height: 20),
              _buildMarketNewsSection(context),
              SizedBox(height: 20),
              _buildPromoSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1A1F31),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Solde total',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '359.000 FCFA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(Icons.send, 'Envoi'),
              _buildActionButton(Icons.add, 'Recharge'),
              _buildActionButton(Icons.more_horiz, 'Plus'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[800],
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Activité récente',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle view more
              },
              child: Text(
                'Voir plus',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        ActivityTile(
          icon: 'assets/images/netflix.png',
          title: 'Netflix',
          date: '26 Septembre 2023',
          amount: '-50.000',
        ),
        ActivityTile(
          icon: 'assets/images/shopping.png',
          title: 'Shopping mensuel',
          date: '23 Septembre 2023',
          amount: '-1.209.000',
        ),
        ActivityTile(
          icon: 'assets/images/netflix.png',
          title: 'Netflix',
          date: '26 Septembre 2023',
          amount: '-50.000',
        ),
      ],
    );
  }

  Widget _buildPatrimoineSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1A1F31),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Patrimoine',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '33.000 FCFA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPatrimoineItem(Icons.account_balance_wallet, 'Liquidité', '32.000F'),
              _buildPatrimoineItem(Icons.savings, 'Epargne', 'Gagnez des intérêts'),
              _buildPatrimoineItem(Icons.trending_up, 'Investir', 'Acheter des titres'),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            'Dépenses du mois',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 200.0,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 1),
                      FlSpot(1, 3),
                      FlSpot(2, 2),
                      FlSpot(3, 5),
                      FlSpot(4, 3.1),
                      FlSpot(5, 4),
                      FlSpot(6, 3.5),
                    ],
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.blue], // Définir le dégradé de couleurs ici
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [Colors.red.withOpacity(0.3), Colors.blue.withOpacity(0.3)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatrimoineItem(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[800],
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(color: Colors.white70),
        ),
        Text(
          subtitle,
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildMadistoreSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MadistorePage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1A1F31),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Madistore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Dépensez vos points',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketNewsSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MarketNewsPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1A1F31),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Market News',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Dernières nouvelles du marché',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PromoPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1A1F31),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Promotions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Profitez des offres spéciales',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF1A1F31),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card, color: Colors.white),
          label: 'Carte',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on, color: Colors.white),
          label: 'Madis',
        ),
      ],
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white70,
    );
  }
}
 */

import 'package:flutter/material.dart';
import '../../widgets/navbar/custom_bottom_navbar.dart';
import '../profils_pages/profile_drawer.dart';
import 'mes_pages_home/balance_card.dart';
import 'mes_pages_home/madistore_section.dart';
import 'mes_pages_home/market_news_section.dart';
import 'mes_pages_home/patrimoine_section.dart';
import 'mes_pages_home/promo_section.dart';
import 'mes_pages_home/recent_activities.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A434740),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileDrawer()),
                          );
                        },
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Bienvenu,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Stack(
                      children: [
                        Icon(Icons.notifications, color: Colors.white),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationsPage()),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Madis Finance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              BalanceCard(),
              SizedBox(height: 20),
              RecentActivities(),
              SizedBox(height: 20),
              SectionPatrimoine(),
              SizedBox(height: 20),
              MadistoreSection(),
              SizedBox(height: 20),
              MarketNewsSection(),
              SizedBox(height: 20),
              PromoSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,  // Définissez l'index courant pour chaque page
        onTap: (index) {
          // Gérer la navigation en fonction de l'index
        },
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notification 1'),
            subtitle: Text('Détails de la notification 1...'),
          ),
          ListTile(
            title: Text('Notification 2'),
            subtitle: Text('Détails de la notification 2...'),
          ),
          ListTile(
            title: Text('Notification 3'),
            subtitle: Text('Détails de la notification 3...'),
          ),
          ListTile(
            title: Text('Notification 4'),
            subtitle: Text('Détails de la notification 4...'),
          ),
        ],
      ),
    );
  }
}
