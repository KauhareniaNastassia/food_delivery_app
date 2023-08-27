import 'package:domain/domain.dart';

class FetchUsersUseCase
    implements FutureUseCase<NoParams, List<UserInfoModel>> {
  final AdminPanelRepository _adminPanelRepository;

  const FetchUsersUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<List<UserInfoModel>> execute(NoParams input) async {
    return _adminPanelRepository.fetchUsers();
  }
}
