import 'package:domain/domain.dart';

class SaveMenuItemChangesUseCase {
  final AdminPanelRepository _adminPanelRepository;

  const SaveMenuItemChangesUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  Future<void> saveMenuItemChanges(MenuItemModel updatedMenuItem) async {
    return _adminPanelRepository.saveMenuItemChanges(updatedMenuItem);
  }
}
