import 'package:flutter/material.dart';
import 'package:mobile_wallet/app/pages/home/home_page.dart';
import 'package:mobile_wallet/app/pages/login/ResetPasswordPage.dart';
import 'package:mobile_wallet/app/pages/login/forgot_password_page.dart';
import 'package:mobile_wallet/app/pages/login/login_page.dart';
import 'package:mobile_wallet/app/pages/sign_up/forms_stepper/multi_step_form_page.dart';
import 'package:mobile_wallet/app/pages/sign_up/landing_page.dart';
import 'package:mobile_wallet/app/pages/sign_up/otp_verification_page.dart';
import 'package:mobile_wallet/app/pages/sign_up/phone_input_page.dart';
import 'package:mobile_wallet/app/pages/sign_up/sign_up_form_page.dart';
import 'package:mobile_wallet/app/pages/sign_up/terms_conditions_page.dart';
import 'package:mobile_wallet/app/pages/sign_up/upload_files_page.dart';
import 'package:mobile_wallet/app/pages/sign_up/welcome_page.dart';
import 'package:mobile_wallet/core/services/auth_service.dart';
import 'package:mobile_wallet/core/utils/theme_service.dart';
import 'package:provider/provider.dart';

import '../core/services/firestore/firestore_service.dart';


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeService _themeService = ThemeService();


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<FirestoreService>(create: (_) => FirestoreService()),
        //ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Madis Finance',
        //theme: themeService.isDarkMode ?
        // ThemeData.dark() : ThemeData.light(),// Utiliser le mode système par défaut
        initialRoute: '/',
        routes: {
          '/': (context) => LandingPage(),
          '/sign_up/phone_input': (context) =>  MultiStepFormPage(),
          '/sign_up/otp_verification': (context) => OTPVerificationPage(),
          //'/sign_up/form': (context) => SignUpFormPage(),
          //'/sign_up/upload_files': (context) => UploadFilePage(),
          '/sign_up/Multi_Step_Form_Page': (context) => MultiStepFormPage(),
          '/sign_up/welcome': (context) => WelcomePage(),
          '/login/login_page': (context) => LoginPage(),
          '/login/forgot_password_page': (context) => ForgotPasswordPage(),
          '/sign_up/terms_conditions_page.dart': (context) => TermsConditionsPage(),
          '/home/HomePage': (context) => HomePage(),
          '/login/reset_password_page': (context)  => ResetPasswordPage(),
        },
      ),
    );
  }
}
