import 'package:domain/domain.dart';

class FetchAllOrdersUseCase
    implements FutureUseCase<NoParams, List<OrderItemForAdminModel>> {
  final AdminPanelRepository _adminPanelRepository;

  FetchAllOrdersUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<List<OrderItemForAdminModel>> execute(NoParams input) async {
    return _adminPanelRepository.fetchAllOrders();
  }
}
