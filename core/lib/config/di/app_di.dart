import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

final AppDI appDI = AppDI();

class AppDI {
  void initDependencies() async {
    DataDI().initDependencies();

    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    instance.registerLazySingleton<FirebaseFirestore>(() => fireStore);

    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    instance.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);

    setupNavigationDependencies();
  }
}
