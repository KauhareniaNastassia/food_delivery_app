import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';

part 'state.dart';

class AdminPanelBloc extends Bloc<AdminPanelEvent, AdminPanelState> {
  final FetchUsersUseCase _fetchUsersUseCase;
  final ChangeUserRoleUseCase _changeUserRoleUseCase;
  final FetchOrderHistoryUseCase _fetchOrderHistoryUseCase;

  AdminPanelBloc({
    required FetchUsersUseCase fetchUsersUseCase,
    required ChangeUserRoleUseCase changeUserRoleUseCase,
    required FetchOrderHistoryUseCase fetchOrderHistoryUseCase,
  })  : _fetchUsersUseCase = fetchUsersUseCase,
        _changeUserRoleUseCase = changeUserRoleUseCase,
        _fetchOrderHistoryUseCase = fetchOrderHistoryUseCase,
        super(const AdminPanelState.initial()) {
    on<InitUsersEvent>(_onInitUsers);
    on<FilterUsersByRoleEvent>(_filterUsersByRole);
    on<ChangeUserRoleEvent>(_changeUserRole);
    on<FetchUserOrderHistoryEvent>(_fetchUserOrderHistory);

    add(
      InitUsersEvent(),
    );
  }

  Future<void> _onInitUsers(
    InitUsersEvent event,
    Emitter<AdminPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        exception: null,
      ),
    );
    try {
      final List<UserInfoModel> users = await _fetchUsersUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          usersList: users,
          isDataProcessing: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          exception: e.toString(),
          isDataProcessing: false,
        ),
      );
    }
  }

  void _filterUsersByRole(
    FilterUsersByRoleEvent event,
    Emitter<AdminPanelState> emit,
  ) {
    if (event.filterValue == AppConstants.allUsers) {
      emit(
        state.copyWith(
          filteredUserList: [],
          selectedFilter: AppConstants.allUsers,
        ),
      );
    } else {
      final List<UserInfoModel> filteredUsersList = state.usersList
          .where((item) => item.userRole == event.filterValue)
          .toList();

      emit(
        state.copyWith(
          filteredUserList: filteredUsersList,
          selectedFilter: event.filterValue,
        ),
      );
    }
  }

  Future<void> _changeUserRole(
    ChangeUserRoleEvent event,
    Emitter<AdminPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        exception: null,
      ),
    );
    try {
      final UserInfoModel updatedUser =
          await _changeUserRoleUseCase.changeUserRole(
        newUserRoleValue: event.newUserRoleValue,
        userId: event.userId,
      );
      final int index = state.usersList.indexWhere(
        (usersListItem) => usersListItem.userId == updatedUser.userId,
      );
      state.usersList[index] = updatedUser;

      if (state.filteredUserList.isNotEmpty) {
        final int index = state.filteredUserList.indexWhere(
          (usersListItem) => usersListItem.userId == updatedUser.userId,
        );
        state.filteredUserList.removeAt(index);
      }

      emit(
        state.copyWith(
          isDataProcessing: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          exception: e.toString(),
          isDataProcessing: false,
        ),
      );
    }
  }

  Future<void> _fetchUserOrderHistory(
    FetchUserOrderHistoryEvent event,
    Emitter<AdminPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        exception: null,
        userOrderHistory: [],
      ),
    );
    try {
      final List<OrderItemModel> userOrderHistory =
          await _fetchOrderHistoryUseCase.execute(event.userId);
      userOrderHistory.isEmpty
          ? emit(
              state.copyWith(
                userOrderHistory: [],
                isDataProcessing: false,
              ),
            )
          : emit(
              state.copyWith(
                userOrderHistory: userOrderHistory,
                isDataProcessing: false,
              ),
            );
    } catch (e) {
      emit(
        state.copyWith(
          exception: e.toString(),
          isDataProcessing: false,
        ),
      );
    }
  }
}
