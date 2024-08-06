import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_wallet/app/app.dart';
import 'package:mobile_wallet/core/services/auth_service.dart';
import 'package:mobile_wallet/core/services/conn_service.dart';
import 'package:mobile_wallet/core/utils/theme_service.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  //final postgresService = PostgresService();
  // postgresService.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBUJU-ssm2XwRJIG9yrfHsNjM75J0FIINQ",
      appId: "1:379146429007:android:add23d166385d68aa4403a",
      messagingSenderId: "379146429007",
      projectId: "application-madis",
    ),
  );


  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<ThemeService>(create: (_) => ThemeService()),
        ChangeNotifierProvider(create: (_) => ConnService()),
      ],
      child: MyApp(),
    ),
  );
}
