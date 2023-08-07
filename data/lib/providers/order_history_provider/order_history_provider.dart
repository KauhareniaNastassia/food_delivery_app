import 'package:data/data.dart';

class OrderHistoryProvider {
  final FirebaseFirestore firestore;

  const OrderHistoryProvider({required this.firestore});

  Future<List<OrderItemEntity>> fetchOrderHistory(String userId) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
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

  Future<void> addOrderItem(OrderItemEntity orderItem) async {
    final CollectionReference orderItems = firestore
        .collection('userInfo')
        .doc(orderItem.userId)
        .collection('ordersHistory');

    final DocumentReference<Object?> newOrderDocument = orderItems.doc();

    await newOrderDocument.set({
      'id': orderItem.id,
      'userId': orderItem.userId,
      'shoppingCart': orderItem.shoppingCart.toJson(),
      'date': orderItem.date,
    });
  }
}
