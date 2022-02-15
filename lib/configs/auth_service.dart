import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petpal/model/user_model.dart';

class AuthService with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? userGoogle;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(
        uid: user.uid,
        profileImageUrl: user.photoURL,
        name: user.displayName,
        phone: user.phoneNumber,
        lastSignInTime: user.metadata.lastSignInTime,
        emailVerified: user.emailVerified,
        creationTime: user.metadata.creationTime,
        loginMethod: user.providerData[0].providerId,
        email: user.email);
  }

  String verificationIdFetched = "";

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }


  getCurrentUser() {
    final auth.User? user = _firebaseAuth.currentUser;
    return user;
  }

  Future googleLogIn() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      userGoogle = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var credentials=await _firebaseAuth.signInWithCredential(credential);
      print(_userFromFirebase(credentials.user));
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future verifyNumber(String phoneNumber) async {
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (auth.PhoneAuthCredential credential) async {
        var credentials = await _firebaseAuth.signInWithCredential(credential);
        print(_userFromFirebase(credentials.user));
        print("Successfully logged in");
      },
      verificationFailed: (auth.FirebaseAuthException exception) {
        print(exception.message);
      },
      codeSent: (String verificationID, int? resendToken) {
        verificationIdFetched = verificationID;
        print("fetched vid: " + verificationIdFetched);
      },
      codeAutoRetrievalTimeout: (String verificationID) {},
    );
    notifyListeners();
  }

  Future otpVerification(String vid, String otpSms) async {
    print(verificationIdFetched);
    try {
      auth.PhoneAuthCredential phoneAuthCredential =
          auth.PhoneAuthProvider.credential(
              verificationId: vid, smsCode: otpSms);
      var credential =
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      print("yvjvjh " + credential.user!.uid.toString());
      print(_userFromFirebase(credential.user));
    } catch (e) {
      print("error.....:   " + e.toString());
    }
    notifyListeners();
  }

  Future logOut() async {
    if (userGoogle != null) {
      await googleSignIn.disconnect();
      notifyListeners();
    }
    _firebaseAuth.signOut();
    notifyListeners();
  }
}
