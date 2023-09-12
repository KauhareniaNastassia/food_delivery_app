import 'package:domain/domain.dart';

class AddNewMenuItemUseCase {
  final AdminPanelRepository _adminPanelRepository;

  const AddNewMenuItemUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  Future<void> addNewMenuItem(MenuItemModel newMenuItem) async {
    return _adminPanelRepository.addNewMenuItem(newMenuItem);
  }
}
