import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';

//* For abstracting the underlying implementation of how a user is authenticated as well as how a user is fetched.
abstract class BaseAuthenticationRepository {
  Stream<firebase_auth.User> get user;

  Future<void> signUpWithEmailAndPassword(
      {@required String email, @required String password});

  Future<void> loginWithEmailAndPassword(
      {@required String email, @required String password});

  Future<void> logOut();
}
