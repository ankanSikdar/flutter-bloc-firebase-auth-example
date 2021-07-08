import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:bloc_firebase_login/repositories/auth/base_authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationRepository extends BaseAuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthenticationRepository({
    firebase_auth.FirebaseAuth firebaseAuth,
    FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<firebase_auth.User> get user => _firebaseAuth.userChanges();

  @override
  Future<void> signUpWithEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      final userCredentail = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredentail.user;

      await _firebaseFirestore.collection('users').doc(user.uid).set({
        'email': email,
        'photo': '',
        'name': '',
      });
    } catch (e) {
      throw Exception('SignUp Failure');
    }
  }

  @override
  Future<void> loginWithEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception('LogIn Failure');
    }
  }

  @override
  Future<void> logOut() async {
    try {
      _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('LogOut Failure');
    }
  }
}
