import 'package:domain/domain.dart';

class ChangeUserRoleUseCase {
  final AdminPanelRepository _adminPanelRepository;

  const ChangeUserRoleUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  Future<UserInfoModel> changeUserRole({
    required String newUserRoleValue,
    required String userId,
  }) async {
    return _adminPanelRepository.changeUserRole(
      newUserRoleValue: newUserRoleValue,
      userId: userId,
    );
  }
}
