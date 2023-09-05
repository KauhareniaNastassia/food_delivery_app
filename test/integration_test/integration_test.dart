import 'package:admin_panel/admin_panel.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:settings/settings.dart';

import 'mock_for_integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late AdminPanelBloc adminPanelBloc;
  late SettingsBloc settingsBloc;

  setUpAll(() async {
    adminPanelBloc = AdminPanelBloc(
      fetchUsersUseCase: FetchUsersUseCaseMock(),
      changeUserRoleUseCase: ChangeUserRoleUseCaseMock(),
      fetchOrderHistoryUseCase: FetchOrderHistoryUseCaseMock(),
      fetchAllOrdersUseCase: FetchAllOrdersUseCaseMock(),
      changeOrderStatusUseCase: ChangeOrderStatusUseCaseMock(),
      saveMenuItemChangesUseCase: SaveMenuItemChangesUseCaseMock(),
      addNewMenuItemChangesUseCase: AddNewMenuItemUseCaseMock(),
      deleteMenuItemChangesUseCase: DeleteMenuItemUseCaseMock(),
      uploadNewMenuItemImageUseCase: UploadNewMenuItemImageUseCaseMock(),
      appRouter: AppRouterMock(),
    );

    settingsBloc = SettingsBloc(
      getThemeUseCase: GetThemeUseCaseMock(),
      setThemeUseCase: SetThemeUseCaseMock(),
      getColorSchemeUseCase: GetColorSchemeUseCaseMock(),
      setColoSchemeUseCase: SetColoSchemeUseCaseMock(),
      getFontSizeUseCase: GetFontSizeUseCaseMock(),
      setFontSizeUseCase: SetFontSizeUseCaseMock(),
    );
  });

  group('OrdersPageContent test', () {
    testWidgets('OrdersPageContent test', (WidgetTester tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<AdminPanelBloc>(
            create: (_) => adminPanelBloc,
          ),
          BlocProvider<SettingsBloc>(
            create: (_) => settingsBloc,
          ),
        ],
        child: const MaterialApp(
          home: OrdersPageContent(),
        ),
      ));

      expect(find.byType(LoadingIndicator), findsNothing);
      expect(find.byType(OrdersPageContent), findsOneWidget);
      expect(find.byType(CategoryFilter), findsOneWidget);
      expect(find.byType(OrderItemsList), findsOneWidget);
    });

    testWidgets('OrdersPageContent test', (WidgetTester tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<AdminPanelBloc>(
            create: (_) => adminPanelBloc,
          ),
          BlocProvider<SettingsBloc>(
            create: (_) => settingsBloc,
          ),
        ],
        child: const MaterialApp(
          home: OrdersPageContent(),
        ),
      ));

      expect(find.text('checkNewOrders'.tr()), findsOneWidget);
    });
  });
}
