import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/entity/menu_item_entity.dart';

class MenuDataProvider {
  final FirebaseFirestore _firestore;

  MenuDataProvider(this._firestore);

  Future<List<MenuItemEntity>> fetchMenuItems() async {
    final querySnapshot = await _firestore.collection('menu').get();

    return querySnapshot.docs
        .map(
          (doc) => MenuItemEntity.fromJson(doc.data()),
        )
        .toList();
  }
}
