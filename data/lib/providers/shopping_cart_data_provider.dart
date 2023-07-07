import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/menu_item_entity.dart';
import '../entity/shopping_cart_entity/shopping_cart_item_entity.dart';

class ShoppingCartDataProvider {
  final FirebaseFirestore _firestore;

  ShoppingCartDataProvider(this._firestore);

  Future<List<MenuItemEntity>> fetchShoppingCartItems() async {
    final querySnapshot = await _firestore.collection('shoppingCart').get();

    return querySnapshot.docs
        .map(
          (doc) => MenuItemEntity.fromJson(doc.data()),
        )
        .toList();
  }

}
