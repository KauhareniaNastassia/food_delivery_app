import 'package:core/config/di/data_di.dart';

import '../navigation.dart';

void setupNavigationDependencies() {
  instance.registerSingleton<AppRouter>(AppRouter());
}
