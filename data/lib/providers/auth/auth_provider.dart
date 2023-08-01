import 'package:data/data.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore;
  final GoogleSignIn _googleSignIn;

  AuthProvider(
    this._firebaseAuth,
    this._fireStore,
    this._googleSignIn,
  );

  Future<UserInfoEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return await getUserInfoFromDB(userId: userCredential.user!.uid);
  }

  Future<UserInfoEntity> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final OAuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    UserCredential result =
        await _firebaseAuth.signInWithCredential(authCredential);

    await _fireStore.collection('userInfo').doc(result.user?.uid).set({
      'userId': result.user?.uid,
      'userName': result.user?.displayName,
      'email': result.user?.email,
    });

    return await getUserInfoFromDB(userId: result.user?.uid ?? '');
  }

  Future<UserInfoEntity> createUserWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _fireStore.collection('userInfo').doc(userCredential.user!.uid).set({
      'userId': userCredential.user!.uid,
      'userName': userName,
      'email': email,
    });

    return await getUserInfoFromDB(userId: userCredential.user!.uid);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  Future<UserInfoEntity> getUserInfoFromDB({
    required String userId,
  }) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _fireStore.collection('userInfo').doc(userId).get();

    final Map<String, dynamic>? userData = doc.data();
    final UserInfoEntity userEntity = UserInfoEntity(
      userId: userId,
      email: userData?['email'] ?? '',
      userName: userData?['userName'] ?? '',
    );
    return userEntity;
  }
}
