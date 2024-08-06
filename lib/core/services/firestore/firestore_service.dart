import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(UserM user) async {
    try {
      await _db.collection('users').doc(user.idNumber).set(user.toMap());
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  Future<UserM?> getUser(String userId) async {
    try {
      DocumentSnapshot doc = await _db.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserM.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }
}
