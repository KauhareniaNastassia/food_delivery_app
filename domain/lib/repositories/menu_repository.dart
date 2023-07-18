import 'package:domain/domain.dart';

abstract class MenuRepository {
  Future<List<MenuItemModel>> fetchMenuItems();
}
