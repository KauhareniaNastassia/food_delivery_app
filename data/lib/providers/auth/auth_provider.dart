import 'package:data/data.dart';

class AuthProvider {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;
  final GoogleSignIn googleSignIn;

  AuthProvider({
    required this.firebaseAuth,
    required this.fireStore,
    required this.googleSignIn,
  });

  Future<UserInfoEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return await getUserInfoFromDB(userId: userCredential.user!.uid);
  }

  Future<UserInfoEntity> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final OAuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    UserCredential result =
        await firebaseAuth.signInWithCredential(authCredential);

    await fireStore.collection('userInfo').doc(result.user?.uid).set({
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
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await fireStore.collection('userInfo').doc(userCredential.user!.uid).set({
      'userId': userCredential.user!.uid,
      'userName': userName,
      'email': email,
    });

    return await getUserInfoFromDB(userId: userCredential.user!.uid);
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }

  Future<UserInfoEntity> getUserInfoFromDB({
    required String userId,
  }) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await fireStore.collection('userInfo').doc(userId).get();

    final Map<String, dynamic>? userData = doc.data();
    final UserInfoEntity userEntity = UserInfoEntity(
      userId: userId,
      email: userData?['email'] ?? '',
      userName: userData?['userName'] ?? '',
    );
    return userEntity;
  }
}
