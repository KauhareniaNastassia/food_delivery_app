import 'package:domain/domain.dart';

class DeleteMenuItemUseCase {
  final AdminPanelRepository _adminPanelRepository;

  const DeleteMenuItemUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  Future<void> deleteMenuItem(String menuItemId) async {
    return _adminPanelRepository.deleteMenuItem(menuItemId);
  }
}
