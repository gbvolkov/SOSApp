import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SOSAppFirebaseUser {
  SOSAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SOSAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SOSAppFirebaseUser> sOSAppFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<SOSAppFirebaseUser>((user) => currentUser = SOSAppFirebaseUser(user));
