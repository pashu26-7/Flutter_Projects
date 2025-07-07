import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String name, String phoneNo, String email) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('userprofile').doc(user.uid).set({
        'name': name,
        'phoneNo': phoneNo,
        'email': email,
      });
    }
  }
}
