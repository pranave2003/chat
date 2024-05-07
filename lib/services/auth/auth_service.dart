import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//instance of firebase
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  //sign user in
  Future<UserCredential> signInWithEmailandPAssword(
      String email, String password) async {
    try {
      //sign in
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
//add a new document for the user in users collection if it doesnt already exists
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential,
        'email': email,
      }, SetOptions(merge: true));
      return userCredential;
    }
    //catch any error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//create a new user
  Future<UserCredential> signUpWithEmailandPassword(
      String email, password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
//after creating the user,create a newd ocument for the user in the user collection
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,

      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign user out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
