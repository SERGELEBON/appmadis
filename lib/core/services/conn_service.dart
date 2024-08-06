/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConnService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  // Connexion avec email ou téléphone et mot de passe
  Future<bool> login(String emailOrPhone, String password) async {
    try {
      if (emailOrPhone.contains('@')) {
        // Connexion avec email
        await _auth.signInWithEmailAndPassword(email: emailOrPhone, password: password);
      } else {
        // Connexion avec numéro de téléphone
        String emailFromPhone = await _getEmailFromPhone(emailOrPhone);
        await _auth.signInWithEmailAndPassword(email: emailFromPhone, password: password);
      }
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Simuler la récupération d'un email lié à un numéro de téléphone
  Future<String> _getEmailFromPhone(String phone) async {
    //  interroger la base de données pour obtenir l'email
    // Exemple fictif :
    return 'user@example.com';
  }

  // Déconnexion de l'utilisateur
  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  // Réinitialisation du mot de passe
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // Obtenir l'utilisateur actuel
  User? get currentUser => _auth.currentUser;

  // Inscription d'un nouvel utilisateur
  Future<bool> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Envoi du code de vérification par SMS
  Future<void> sendVerificationCode(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          } else {
            print('Verification failed. Code: ${e.code}. Message: ${e.message}');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          notifyListeners();
        },
      );
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // Vérification du code envoyé par SMS
  Future<bool> verifyCode(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
 */
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:encrypt/encrypt.dart' as encrypt;


class ConnService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  // Helper method to encrypt the password
  String encryptPassword(String password) {
    final key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1'); // Use a 32 byte key
    final iv = encrypt.IV.fromLength(16); // Use a 16 byte IV
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);
    return encrypted.base64;
  }

  Future<bool> login(String emailOrPhone, String password) async {
    try {
      String encryptedPassword = encryptPassword(password);

      if (emailOrPhone.contains('@')) {
        await _auth.signInWithEmailAndPassword(email: emailOrPhone, password: encryptedPassword);
      } else {
        String emailFromPhone = await _getEmailFromPhone(emailOrPhone);
        await _auth.signInWithEmailAndPassword(email: emailFromPhone, password: encryptedPassword);
      }
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> _getEmailFromPhone(String phone) async {
    return 'user@example.com';
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  // Méthode pour la réinitialisation du mot de passe
  Future<bool> resetPassword({required String otp, required String newPassword}) async {
    try {
      await _auth.confirmPasswordReset(code: otp, newPassword: newPassword);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  User? get currentUser => _auth.currentUser;

  Future<bool> signUp(String email, String password) async {
    try {
      String encryptedPassword = encryptPassword(password);
      await _auth.createUserWithEmailAndPassword(email: email, password: encryptedPassword);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> sendVerificationCode(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          } else {
            print('Verification failed. Code: ${e.code}. Message: ${e.message}');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          notifyListeners();
        },
      );
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> verifyCode(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

}


