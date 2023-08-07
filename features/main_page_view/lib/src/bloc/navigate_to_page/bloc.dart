import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';

part 'state.dart';

class NavigateToPageBloc
    extends Bloc<NavigateToPageEvent, NavigateToPageState> {
  final AppRouter _appRouter;

  NavigateToPageBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(
          NavigateToPageState(),
        ) {
    on<NavigateBackEvent>(_onNavigateBack);
    on<NavigateToMenuItemEvent>(_onNavigateToMenuItem);
    on<NavigateToMainPageEvent>(_onNavigateToMainPage);
    on<NavigateToSignInPageEvent>(_onNavigateToSignInPage);
    on<NavigateToShoppingCartPageEvent>(_onNavigateToShoppingCartPage);
  }

  void _onNavigateBack(
    NavigateBackEvent event,
    Emitter<NavigateToPageState> emit,
  ) {
    _appRouter.pop();
  }

  void _onNavigateToMenuItem(
    NavigateToMenuItemEvent event,
    Emitter<NavigateToPageState> emit,
  ) {
    _appRouter.navigate(
      MenuItemDetailsScreenRoute(
        menuItem: event.menuItem,
      ),
    );
  }

  void _onNavigateToMainPage(
    NavigateToMainPageEvent event,
    Emitter<NavigateToPageState> emit,
  ) {
    _appRouter.navigate(
      const MainPageRoute(
        children: <PageRouteInfo<dynamic>>[
          MainPageScreenRoute(),
        ],
      ),
    );
  }

  void _onNavigateToSignInPage(
    NavigateToSignInPageEvent event,
    Emitter<NavigateToPageState> emit,
  ) {
    _appRouter.navigate(
      const SignInPageScreenRoute(),
    );
  }

  void _onNavigateToShoppingCartPage(
    NavigateToShoppingCartPageEvent event,
    Emitter<NavigateToPageState> emit,
  ) {
    _appRouter.navigate(
      const MainPageRoute(
        children: <PageRouteInfo<dynamic>>[
          ShoppingCartPageScreenRoute(),
        ],
      ),
    );
  }
}
