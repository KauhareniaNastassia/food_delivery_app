import 'package:domain/models/menu_item_model/menu_item_model.dart';
import 'package:domain/usecases/usecase.dart';

import '../repositories/menu_repository.dart';

class FetchMenuItemsUseCase
    implements FutureUseCase<NoParams, List<MenuItemModel>> {
  final MenuRepository _menuRepository;

  const FetchMenuItemsUseCase({required MenuRepository menuRepository})
      : _menuRepository = menuRepository;

  @override
  Future<List<MenuItemModel>> execute(NoParams input) async {
    return _menuRepository.fetchMenuItems();
  }
}
