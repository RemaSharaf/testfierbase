import 'package:firebase_auth/firebase_auth.dart';
import 'package:fire_base_test/models/process_response.dart';

class FbAuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<ProcessResponse> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      var emailVerified = userCredential.user!.emailVerified;
      return ProcessResponse(
          massage:
              emailVerified ? "Logged in successfully" : "verify your email",
          success: emailVerified);
    } catch (error) {
      return ProcessResponse(massage: "Something went wrong", success: false);
    }
  }

  Future<ProcessResponse> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      return ProcessResponse(
          massage: "Registered successfully ,verify your email", success: true);
    } catch (error) {
      return ProcessResponse(massage: "Something went wrong", success: false);
    }
  }

  Future<ProcessResponse> signOut() async {
    await _firebaseAuth.signOut();
    return ProcessResponse(massage: "signed out successfully", success: true);
  }

  User get user => _firebaseAuth.currentUser!;
  Future<ProcessResponse> forgetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return ProcessResponse(
        massage: ("Password reset email sent"), success: true);
  }
}
