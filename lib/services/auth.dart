import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traqr_app/repos/user_repo.dart';
import 'package:traqr_app/services/shared_prefs.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  UserRepository _repository = UserRepository();

  Stream<User> get authStateChange => _auth.authStateChanges();

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    bool isNewUser = authResult.additionalUserInfo.isNewUser;
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded. $user');
      if (!user.email.contains('@vitstudent.ac.in')) signOut();
      String regNo = user.displayName.substring(user.displayName.length - 9);
      print(regNo);
      sharedPreferences.setString('regNo', regNo);
      if (isNewUser) {
        print("new user!!! omg");
        await _repository.addUser(regNo, user.displayName);
      }
    }
  }

  Future signOut() async {
    await _googleSignIn.signOut();
    _auth.signOut();
    print("User Signed Out");
  }
}
