import 'package:data/data.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore;

  AuthProvider(
    this._firebaseAuth,
    this._fireStore,
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

    await _fireStore.collection('usersInfo').doc(userCredential.user!.uid).set({
      'userId': userCredential.user!.uid,
      'userName': userName,
      'email': email,
    });

    return await getUserInfoFromDB(userId: userCredential.user!.uid);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserInfoEntity> getUserInfoFromDB({
    required String userId,
  }) async {
    final DocumentSnapshot<Map<String, dynamic>> doc = await _fireStore
        .collection('usersInfo')
        .doc(userId)
        .get();

    final Map<String, dynamic>? userData = doc.data();
    final UserInfoEntity userEntity = UserInfoEntity(
      userId: userId,
      email: userData?['email'] ?? '',
      userName: userData?['userName'] ?? '',
    );
    return userEntity;
  }
}
