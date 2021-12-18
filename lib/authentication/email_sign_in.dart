import 'package:firebase_auth/firebase_auth.dart';

void signInWithEmailAndPassword(String email, String password) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? user = (await _auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  ))
      .user;
}
