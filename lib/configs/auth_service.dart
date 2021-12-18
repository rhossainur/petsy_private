import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petpal/model/user_model.dart';

class AuthService with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final googleSignIn=GoogleSignIn();
  GoogleSignInAccount? _user;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {

      return null;
    }
    return User(user.uid, user.email);
  }

  String verificationIdFetched = "";

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future googleLogIn() async{
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    }
    catch(e){
      print(e);
    }
    notifyListeners();
  }

  Future verifyNumber(String phoneNumber) async{
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (auth.PhoneAuthCredential credential) async{
        var credentials=await _firebaseAuth.signInWithCredential(credential);
        _userFromFirebase(credentials.user);
        print("Successfully logged in");

      },
      verificationFailed: (auth.FirebaseAuthException exception) {
        print(exception.message);

      },
      codeSent: (String verificationID, int? resendToken) {
        verificationIdFetched = verificationID;
        print("fetched vid: "+verificationIdFetched);
      },
      codeAutoRetrievalTimeout: (String verificationID) {
      },
    );
    notifyListeners();
  }

  Future otpVerification(String vid,String otpSms) async {
    print(verificationIdFetched);
    try{
      auth.PhoneAuthCredential phoneAuthCredential = auth.PhoneAuthProvider
          .credential(verificationId: vid, smsCode: otpSms);
      var credential = await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      print("yvjvjh "+credential.user!.uid.toString());
      _userFromFirebase(credential.user);
    }
    catch(e){
      print("error.....:   "+e.toString());
    }
    notifyListeners();
  }

  Future logOut() async{
    if(_user!=null){
      await googleSignIn.disconnect();
    }
    _firebaseAuth.signOut();
    notifyListeners();
  }
}
