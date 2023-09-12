import 'package:admin_panel/admin_panel.dart';
import 'package:domain/domain.dart';
import 'package:mockito/mockito.dart';
import 'package:navigation/navigation.dart';

class MockAdminPanelBloc extends Mock implements AdminPanelBloc {}

class FetchUsersUseCaseMock extends Mock implements FetchUsersUseCase {}

class ChangeUserRoleUseCaseMock extends Mock implements ChangeUserRoleUseCase {}

class FetchOrderHistoryUseCaseMock extends Mock
    implements FetchOrderHistoryUseCase {}

class FetchAllOrdersUseCaseMock extends Mock implements FetchAllOrdersUseCase {}

class ChangeOrderStatusUseCaseMock extends Mock
    implements ChangeOrderStatusUseCase {}

class SaveMenuItemChangesUseCaseMock extends Mock
    implements SaveMenuItemChangesUseCase {}

class AddNewMenuItemUseCaseMock extends Mock implements AddNewMenuItemUseCase {}

class DeleteMenuItemUseCaseMock extends Mock implements DeleteMenuItemUseCase {}

class UploadNewMenuItemImageUseCaseMock extends Mock
    implements UploadNewMenuItemImageUseCase {}

class AppRouterMock extends Mock implements AppRouter {}

class GetThemeUseCaseMock extends Mock implements GetThemeUseCase {
  @override
  Future<bool> execute(NoParams) async {
    return Future(() => true);
  }
}

class SetThemeUseCaseMock extends Mock implements SetThemeUseCase {}

class GetColorSchemeUseCaseMock extends Mock implements GetColorSchemeUseCase {
  @override
  Future<bool> execute(NoParams) async {
    return Future(() => true);
  }
}

class SetColoSchemeUseCaseMock extends Mock implements SetColorSchemeUseCase {}

class GetFontSizeUseCaseMock extends Mock implements GetFontSizeUseCase {
  @override
  Future<double> execute(NoParams) async {
    return Future(() => 1.0);
  }
}

class SetFontSizeUseCaseMock extends Mock implements SetFontSizeUseCase {}
