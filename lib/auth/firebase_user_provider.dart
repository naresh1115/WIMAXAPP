import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WimaxFirebaseUser {
  WimaxFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WimaxFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WimaxFirebaseUser> wimaxFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<WimaxFirebaseUser>((user) => currentUser = WimaxFirebaseUser(user));
