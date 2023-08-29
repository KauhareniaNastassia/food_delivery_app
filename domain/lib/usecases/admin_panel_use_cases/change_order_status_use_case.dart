import 'package:domain/domain.dart';

class ChangeOrderStatusUseCase {
  final AdminPanelRepository _adminPanelRepository;

  const ChangeOrderStatusUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  Future<void> changeOrderStatus({
    required String userId,
    required int orderId,
  }) async {
    return _adminPanelRepository.changeOrderStatus(
      userId: userId,
      orderId: orderId,
    );
  }
}
