import 'dart:developer';

import 'package:data/data.dart';

class FirebaseFireStoreProvider {
  final FirebaseFirestore fireStore;

  const FirebaseFireStoreProvider({
    required this.fireStore,
  });

  ///menu
 /* Future<List<MenuItemEntity>> fetchMenuItems() async {
    final querySnapshot = await fireStore.collection('newMenu').get();

log('FirebaseFireStoreProvider');
log(querySnapshot.docs
    .map(
      (doc) => MenuItemEntity.fromJson(doc.data()),
)
    .toList().toString());
    return querySnapshot.docs
        .map(
          (doc) => MenuItemEntity.fromJson(doc.data()),
        )
        .toList();
  }*/

  Future<List<MenuItemEntity>> fetchMenuItems() async {
    final querySnapshot = await fireStore.collection('newMenu').get();
    return querySnapshot.docs
        .map(
          (doc) => MenuItemEntity.fromJson(doc.data()),
    )
        .toList();
  }



  ///order history
  Future<List<OrderItemEntity>> fetchOrderHistory(String userId) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await fireStore
        .collection('userInfo')
        .doc(userId)
        .collection('ordersHistory')
        .get();

    return querySnapshot.docs
        .map(
          (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
              OrderItemEntity.fromJson(doc.data()),
        )
        .toList();
  }

  Future<void> addOrderItem({
    required String userId,
    required OrderItemEntity orderItem,
  }) async {
    final CollectionReference orderItems = fireStore
        .collection('userInfo')
        .doc(userId)
        .collection('ordersHistory');

    final DocumentReference<Object?> orderItemsDocument = orderItems.doc();

    await orderItemsDocument.set({
      'id': orderItem.id,
      'shoppingCart': orderItem.shoppingCart.toJson(),
      'date': orderItem.date,
    });
  }

  ///auth
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

  Future<void> setUserToDB({
    required String userId,
    required String userName,
    required String email,
  }) async {
    await fireStore.collection('userInfo').doc(userId).set({
      'userId': userId,
      'userName': userName,
      'email': email,
    });
  }
}
