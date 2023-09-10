import 'dart:io';

import 'package:data/data.dart';

class FirebaseFireStoreProvider {
  final FirebaseFirestore fireStore;

  const FirebaseFireStoreProvider({
    required this.fireStore,
  });

  ///menu
  Future<List<MenuItemEntity>> fetchMenuItems() async {
    final querySnapshot = await fireStore.collection('menu').get();

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
      'isCompleted': orderItem.isCompleted,
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
      userRole: userData?['userRole'] ?? '',
    );
    return userEntity;
  }

  Future<void> setUserToDB({
    required UserInfoEntity userInfoEntity,
  }) async {
    await fireStore.collection('userInfo').doc(userInfoEntity.userId).set({
      'userId': userInfoEntity.userId,
      'userName': userInfoEntity.userName,
      'email': userInfoEntity.email,
      'userRole': userInfoEntity.userRole,
    });
  }

  ///admin panel
  Future<List<UserInfoEntity>> fetchUsers() async {
    final QuerySnapshot<Map<String, dynamic>> userInfoQuerySnapshot =
        await fireStore.collection('userInfo').get();

    return userInfoQuerySnapshot.docs
        .map(
          (doc) => UserInfoEntity.fromJson(doc.data()),
        )
        .toList();
  }

  Future<void> changeUserRole({
    required String newUserRoleValue,
    required String userId,
  }) async {
    final CollectionReference<Map<String, dynamic>> usersList =
        fireStore.collection('userInfo');

    await usersList.doc(userId).update({
      'userRole': newUserRoleValue,
    });
  }

  Future<List<OrderItemForAdminEntity>> fetchAllOrders() async {
    final QuerySnapshot<Map<String, dynamic>> userInfoQuerySnapshot =
        await fireStore.collection('userInfo').get();
    List<OrderItemForAdminEntity> allOrders = [];

    for (int i = 0; i < userInfoQuerySnapshot.docs.length; i++) {
      final QuerySnapshot<Map<String, dynamic>> ordersQuerySnapshot =
          await userInfoQuerySnapshot.docs[i].reference
              .collection('ordersHistory')
              .get();
      for (int j = 0; j < ordersQuerySnapshot.docs.length; j++) {
        final Map<String, dynamic> orderData =
            ordersQuerySnapshot.docs[j].data();

        final OrderItemEntity orderEntity = OrderItemEntity.fromJson(orderData);
        final UserInfoEntity userInfoEntity =
            UserInfoEntity.fromJson(userInfoQuerySnapshot.docs[i].data());

        final OrderItemForAdminEntity orderItemForAdminEntity =
            OrderItemForAdminEntity(
          userId: userInfoEntity.userId,
          email: userInfoEntity.email,
          orderItem: orderEntity,
        );
        allOrders.add(orderItemForAdminEntity);
      }
    }

    return allOrders;
  }

  Future<OrderItemForAdminEntity> changeOrderStatus({
    required String userId,
    required int orderId,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> orderItems = await fireStore
        .collection('userInfo')
        .doc(userId)
        .collection('ordersHistory')
        .get();

    late final OrderItemForAdminEntity updatedOrderItemForAdminEntity;

    for (int i = 0; i < orderItems.docs.length; i++) {
      final Map<String, dynamic> orderData = orderItems.docs[i].data();

      final OrderItemEntity orderEntity = OrderItemEntity.fromJson(orderData);

      if (orderEntity.id == orderId) {
        await orderItems.docs[i].reference.update({
          'isCompleted': true,
        });

        final QuerySnapshot<Map<String, dynamic>> userInfoQuerySnapshot =
            await fireStore.collection('userInfo').get();

        final UserInfoEntity userInfoEntity =
            UserInfoEntity.fromJson(userInfoQuerySnapshot.docs[i].data());

        updatedOrderItemForAdminEntity = OrderItemForAdminEntity(
          userId: userInfoEntity.userId,
          email: userInfoEntity.email,
          orderItem: orderEntity.copyWith(isCompleted: true),
        );
      }
    }

    return updatedOrderItemForAdminEntity;
  }

  Future<void> saveMenuItemChanges(MenuItemEntity updatedMenuItem) async {
    final DocumentSnapshot<Map<String, dynamic>> menuItemFromDB =
        await fireStore.collection('menu').doc(updatedMenuItem.id).get();

    menuItemFromDB.reference.update({
      "title": updatedMenuItem.title,
      "image": updatedMenuItem.image,
      "cost": updatedMenuItem.cost,
      "description": updatedMenuItem.description,
      "ingredients": updatedMenuItem.ingredients,
      "category": updatedMenuItem.category,
    });
  }

  Future<String> uploadNewImage(File uploadedMenuItemImage) async {
    final Reference imageReference = FirebaseStorage.instance
        .ref()
        .child('menuImages')
        .child('$uploadedMenuItemImage');
    await imageReference.putFile(uploadedMenuItemImage);

    return await imageReference.getDownloadURL();
  }

  Future<void> addNewMenuItem(MenuItemEntity newMenuItem) async {
    final DocumentReference<Map<String, dynamic>> menuDocumentRef =
        fireStore.collection('menu').doc();

    await menuDocumentRef.set({
      "id": menuDocumentRef.id,
      "title": newMenuItem.title,
      "image": newMenuItem.image,
      "cost": newMenuItem.cost,
      "description": newMenuItem.description,
      "ingredients": newMenuItem.ingredients,
      "category": newMenuItem.category,
    });
  }

  Future<void> deleteMenuItem(String menuItemId) async {
    final DocumentReference<Map<String, dynamic>> menuItemFromDB =
        fireStore.collection('menu').doc(menuItemId);

    await menuItemFromDB.delete();
  }
}
