import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      var inputs = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return inputs.user;
      // } on FirebaseAuthException catch (e) {
      //   // Your logic for Firebase related exceptions
    } catch (e) {
      print("Error2 : ${e.toString()}");
      rethrow;
    }
  }

  Future<void> signOut() async {
    print('${_auth.currentUser} is signed out');
    return await _auth.signOut();
  }

  Future<User?> register(String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  bool currentUser() {
    return _auth.currentUser?.email != null ? true : false;
  }
}
