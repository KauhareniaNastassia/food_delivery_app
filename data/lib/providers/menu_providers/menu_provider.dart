import 'package:data/data.dart';

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
