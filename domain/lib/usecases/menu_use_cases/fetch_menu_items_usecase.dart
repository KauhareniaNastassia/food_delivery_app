import 'package:domain/domain.dart';

class FetchMenuItemsUseCase
    implements FutureUseCase<NoParams, List<MenuItemModel>> {
  final MenuRepository _menuRepository;

  const FetchMenuItemsUseCase({
    required MenuRepository menuRepository,
  }) : _menuRepository = menuRepository;

  @override
  Future<List<MenuItemModel>> execute(NoParams input) async {
    return _menuRepository.fetchMenuItems();
  }
}
