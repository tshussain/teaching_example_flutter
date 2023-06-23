import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Class that will use Firebase authentication servre
class AuthRepository {
  FirebaseAuth firebaseAuth;

  //Using Stream to listen to Authentication State
  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  /* Initialize the firebase auth */
  AuthRepository() : firebaseAuth = FirebaseAuth.instance;

  //SIGN UP METHOD
  Future<String> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message== null ? "Unknown error in signup" : e.message!;
    }
  }

  //SIGN IN METHOD
  Future<bool> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
  //
  // Future<User> registerUserEmail(email, password) async {
  //   UserCredential result = await auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   final User user = result.user!;
  //   notifyListeners();
  //   return user;
  // }
  //
  // Future<User> signInEmail(String email, String password) async {
  //   UserCredential result =
  //       await auth.signInWithEmailAndPassword(email: email, password: password);
  //   final User user = result.user!;
  //   notifyListeners();
  //   return user;
  // }
  //
  // bool isLoggedIn() {
  //   auth.authStateChanges().listen((User? user) {
  //     if (user != null) {
  //       return true
  //     }
  //     return false
  //   });
  // }
  // Widget build(BuildContext context) {
  //   return StreamBuilder<User>(
  //     stream: FirebaseAuth.instance.authStateChanges(),
  //     builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
  //       if(snapshot.hasData) {
  //         print("data exists");
  //         return First();
  //       }
  //       else {
  //         return SignIn();
  //       }
  //     },
  //   );
  // }
  //
  // void logOut() async {
  //   await auth.signOut();
  //   notifyListeners();
  // }

