import 'dart:io';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';

part 'state.dart';

class AdminPanelBloc extends Bloc<AdminPanelEvent, AdminPanelState> {
  final FetchUsersUseCase _fetchUsersUseCase;
  final ChangeUserRoleUseCase _changeUserRoleUseCase;
  final FetchOrderHistoryUseCase _fetchOrderHistoryUseCase;
  final FetchAllOrdersUseCase _fetchAllOrdersUseCase;
  final ChangeOrderStatusUseCase _changeOrderStatusUseCase;
  final SaveMenuItemChangesUseCase _saveMenuItemChangesUseCase;
  final AddNewMenuItemUseCase _addNewMenuItemChangesUseCase;
  final DeleteMenuItemUseCase _deleteMenuItemChangesUseCase;
  final UploadNewMenuItemImageUseCase _uploadNewMenuItemImageUseCase;
  final AppRouter _appRouter;

  AdminPanelBloc({
    required FetchUsersUseCase fetchUsersUseCase,
    required ChangeUserRoleUseCase changeUserRoleUseCase,
    required FetchOrderHistoryUseCase fetchOrderHistoryUseCase,
    required FetchAllOrdersUseCase fetchAllOrdersUseCase,
    required ChangeOrderStatusUseCase changeOrderStatusUseCase,
    required SaveMenuItemChangesUseCase saveMenuItemChangesUseCase,
    required AddNewMenuItemUseCase addNewMenuItemChangesUseCase,
    required DeleteMenuItemUseCase deleteMenuItemChangesUseCase,
    required UploadNewMenuItemImageUseCase uploadNewMenuItemImageUseCase,
    required AppRouter appRouter,
  })  : _fetchUsersUseCase = fetchUsersUseCase,
        _changeUserRoleUseCase = changeUserRoleUseCase,
        _fetchOrderHistoryUseCase = fetchOrderHistoryUseCase,
        _fetchAllOrdersUseCase = fetchAllOrdersUseCase,
        _changeOrderStatusUseCase = changeOrderStatusUseCase,
        _saveMenuItemChangesUseCase = saveMenuItemChangesUseCase,
        _addNewMenuItemChangesUseCase = addNewMenuItemChangesUseCase,
        _deleteMenuItemChangesUseCase = deleteMenuItemChangesUseCase,
        _uploadNewMenuItemImageUseCase = uploadNewMenuItemImageUseCase,
        _appRouter = appRouter,
        super(AdminPanelState.initial()) {
    on<InitUsersEvent>(_onInitUsers);
    on<FilterUsersByRoleEvent>(_filterUsersByRole);
    on<ChangeUserRoleEvent>(_changeUserRole);
    on<FetchUserOrderHistoryEvent>(_fetchUserOrderHistory);
    on<InitOrdersEvent>(_onInitOrders);
    on<FilterOrdersByCompleteEvent>(_onFilterOrdersByComplete);
    on<ChangeOrderStatusEvent>(_changeOrderStatus);
    on<EditModeEvent>(_onEditMode);
    on<SaveMenuItemChangesEvent>(_onSaveMenuItemChanges);
    on<NavigateToAddItemPageEvent>(_onNavigateToAddItemPage);
    on<DeleteMenuItemEvent>(_onDeleteMenuItem);
    on<SelectMenuItemImageEvent>(_onSelectMenuItemImage);
    on<NavigateBackToAdminEvent>(_onNavigateBack);
    on<InitMenuItem>(_onInitMenuItem);

    add(
      InitUsersEvent(),
    );
    add(
      InitOrdersEvent(),
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
          (usersItem) => usersItem.userId == updatedUser.userId,
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

  Future<void> _onInitOrders(
    InitOrdersEvent event,
    Emitter<AdminPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        completedOrdersList: [],
        unCompletedOrdersList: [],
        exception: null,
      ),
    );
    try {
      final List<OrderItemForAdminModel> allOrders =
          await _fetchAllOrdersUseCase.execute(
        const NoParams(),
      );
      final List<OrderItemForAdminModel> completedOrdersList = [];
      final List<OrderItemForAdminModel> unCompletedOrdersList = [];

      for (int i = 0; i < allOrders.length; i++) {
        allOrders[i].orderItem.isCompleted
            ? completedOrdersList.add(allOrders[i])
            : unCompletedOrdersList.add(allOrders[i]);
      }

      emit(
        state.copyWith(
          completedOrdersList: completedOrdersList,
          unCompletedOrdersList: unCompletedOrdersList,
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

  void _onFilterOrdersByComplete(
    FilterOrdersByCompleteEvent event,
    Emitter<AdminPanelState> emit,
  ) {
    emit(
      state.copyWith(
        selectedOrdersFilter: event.filterValue,
      ),
    );
  }

  Future<void> _changeOrderStatus(
    ChangeOrderStatusEvent event,
    Emitter<AdminPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        exception: null,
      ),
    );
    try {
      final OrderItemForAdminModel updatedOrderItem =
          await _changeOrderStatusUseCase.changeOrderStatus(
        userId: event.userId,
        orderId: event.orderId,
      );

      late final int index;
      for (int i = 0; i < state.unCompletedOrdersList.length; i++) {
        if (state.unCompletedOrdersList[i].userId == event.userId &&
            state.unCompletedOrdersList[i].orderItem.id == event.orderId) {
          index = i;
        }
      }
      state.unCompletedOrdersList.removeAt(index);

      final List<OrderItemForAdminModel> updatedCompletedOrdersList = [
        updatedOrderItem,
        ...state.completedOrdersList,
      ];

      emit(
        state.copyWith(
          completedOrdersList: updatedCompletedOrdersList,
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

  void _onEditMode(
    EditModeEvent event,
    Emitter<AdminPanelState> emit,
  ) {
    emit(
      state.copyWith(
        isItemEditing: event.modeValue,
      ),
    );
  }

  Future<void> _onSelectMenuItemImage(
    SelectMenuItemImageEvent event,
    Emitter<AdminPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        uploadedMenuItemImage: '',
        isDataProcessing: true,
        exception: null,
      ),
    );
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      emit(
        state.copyWith(
          isDataProcessing: false,
          uploadedMenuItemImage: pickedImage!.path,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDataProcessing: false,
          exception: e.toString(),
        ),
      );
    }
  }

  Future<void> _onSaveMenuItemChanges(
    SaveMenuItemChangesEvent event,
    Emitter<AdminPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        exception: null,
      ),
    );
    try {
       String newMenuItemImage = '';

      if (state.uploadedMenuItemImage != '') {
        newMenuItemImage = await _uploadNewMenuItemImageUseCase.uploadNewImage(
          uploadedMenuItemImage: File(state.uploadedMenuItemImage),
        );
      }

      late final MenuItemModel menuItemUpdated;

      if (newMenuItemImage == '') {
        menuItemUpdated = event.menuItem;
      } else {
        menuItemUpdated = MenuItemModel(
          id: event.menuItem.id,
          title: event.menuItem.title,
          cost: event.menuItem.cost,
          image: newMenuItemImage,
          category: event.menuItem.category,
          description: event.menuItem.description,
          ingredients: event.menuItem.ingredients,
        );
      }

      event.menuItem.id == ''
          ? await _addNewMenuItemChangesUseCase.addNewMenuItem(
              newMenuItem: menuItemUpdated,
            )
          : await _saveMenuItemChangesUseCase.saveMenuItemChanges(
              updatedMenuItem: menuItemUpdated,
            );
      event.onComplete();

      emit(
        state.copyWith(
          menuItem: menuItemUpdated,
          uploadedMenuItemImage: '',
          isDataProcessing: false,
          isItemEditing: false,
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

  void _onNavigateToAddItemPage(
    NavigateToAddItemPageEvent event,
    Emitter<AdminPanelState> emit,
  ) {
    emit(
      state.copyWith(
        isItemEditing: true,
      ),
    );
    _appRouter.navigate(
      MenuItemDetailsScreenForAdminRoute(
        menuItem: MenuItemModel(
          id: '',
          title: '',
          cost: 0.0,
          image: '',
          description: '',
          ingredients: [],
          category: AppConstants.menuItemCategory[0],
        ),
      ),
    );
  }

  Future<void> _onDeleteMenuItem(
    DeleteMenuItemEvent event,
    Emitter<AdminPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        isDataProcessing: true,
        exception: null,
      ),
    );
    try {
      await _deleteMenuItemChangesUseCase.deleteMenuItem(
        menuItemId: event.menuItemId,
      );

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

  void _onNavigateBack(
    NavigateBackToAdminEvent event,
    Emitter<AdminPanelState> emit,
  ) {
    add(EditModeEvent(modeValue: false));
    _appRouter.pop();
  }

  void _onInitMenuItem(
    InitMenuItem event,
    Emitter<AdminPanelState> emit,
  ) {
    emit(
      state.copyWith(
        menuItem: event.menuItem,
      ),
    );
  }
}
