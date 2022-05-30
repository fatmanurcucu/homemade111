import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseFirestore instance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user2 = FirebaseAuth.instance.currentUser;
  // giriş yapar
  Future<User?> signIn(String email, String password) async {
    UserCredential user;
    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return null;
    }

    if (user.user != null) {
      return user.user;
    } else {
      return null;
    }
  }

  //çıkış yapar
  signOut() async {
    return await auth.signOut();
  }

  Future<User?> signInWithGoogle(String email, String password) async {
    var user;

    return user.user;
  }

  //yeni kullanıcı oluşturur.
  Future<User?> createUser(String name, String email, String password) async {
    if (password.length >= 6) {
      try {
        var user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await instance.collection("Users").doc(user.user!.uid).set({
          'username': name,
          'useremail': email,
          'userpass': password,
          'TamIsim': null,
          'telefonNumarasi': null,
          'resim': null
        });
        await user.user?.sendEmailVerification();

        return user.user;
      } on FirebaseException catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }
}
