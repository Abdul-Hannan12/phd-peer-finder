import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phd_peer/core/constants/hive_boxes.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<bool> signupWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'email': email,
      });

      await userCredential.user?.sendEmailVerification();

      String? token = await _auth.currentUser!.getIdToken();
      await userBox.put('token', token);

      return true;
    } catch (e) {
      print('Error signing up: $e');
      return false;
    }
  }

  Future<bool> signupWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final user = userCredential.user;
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'email': user?.email,
      });

      await user?.sendEmailVerification();

      String? token = await _auth.currentUser!.getIdToken();
      await userBox.put('token', token);

      return true;
    } catch (e) {
      print('Error signing up with Google: $e');
      return false;
    }
  }

  Future<bool> loginWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? token = await _auth.currentUser!.getIdToken();
      await userBox.put('token', token);

      return true;
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }

  Future<bool> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      await _auth.signInWithCredential(credential);

      String? token = await _auth.currentUser!.getIdToken();
      await userBox.put('token', token);

      return true;
    } catch (e) {
      print('Error logging in with Google: $e');
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
      await userBox.clear();
      return true;
    } catch (e) {
      print('Error signing out: $e');
      return false;
    }
  }
}
